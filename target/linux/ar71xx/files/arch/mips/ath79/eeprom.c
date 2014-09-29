#include <asm/mach-ath79/ath79.h>
#include <asm/mach-ath79/ar71xx_regs.h>

#include <linux/delay.h>

#include "common.h"
#include "eeprom.h"

static u32 flash_32m_jedec[] = {0x20BA19, 0xEF4019, 0xC22019};

static void __iomem *ath79_spi_base;


static char ath79_eeprom[64 * 1024];

static u32 ath79_flash_read_id(void)
{
	u32 rd = 0;

	ath79_spi_start();

	ath79_spi_bit_banger(OPCODE_RDID);

	ath79_spi_delay_8();
	ath79_spi_delay_8();
	ath79_spi_delay_8();

	rd = ath79_spi_read(AR71XX_SPI_REG_RDS) & 0xffffff;

	ath79_spi_done();

	return rd;
}

static void ath79_flash_reset(void)
{
	ath79_spi_send_instruction(OPCODE_RSTEN);
	ath79_spi_send_instruction(OPCODE_RESET);

	udelay(100);
}

static int ath79_flash_read(u32 addr, u32 len, void *buf)
{
	int i;
	u32 bytes_left;
	void *write_addr;

	bytes_left = len;
	write_addr = buf;

	ath79_spi_start();
	ath79_spi_deselect();

	ath79_flash_reset();

	ath79_spi_send_instruction(OPCODE_WREN);
	ath79_spi_bit_banger(OPCODE_WREAR);
	ath79_spi_bit_banger((addr & 0xff000000) >> 24);
	ath79_spi_go();

	ath79_spi_bit_banger(OPCODE_READ);
	ath79_spi_send_addr(addr);

	while (bytes_left)
	{
		for (i = 0; i < sizeof (u32); i++)
			ath79_spi_delay_8();

		*(u32 *)write_addr = ath79_spi_read(AR71XX_SPI_REG_RDS);

		write_addr = (void *) ((u32) write_addr + sizeof (u32));
		bytes_left -= sizeof (u32);
	}

	ath79_spi_go();
	ath79_spi_deselect();

	ath79_flash_reset();

	ath79_spi_done();

	return 0;
}

u8 *ath79_get_eeprom(void)
{
	int i;
	u32 jedec_id;

	ath79_spi_base = ioremap_nocache(AR71XX_SPI_BASE, AR71XX_SPI_SIZE);

	jedec_id = ath79_flash_read_id();

	for (i = 0; i < ARRAY_SIZE(flash_32m_jedec); i++)
	{
		if (flash_32m_jedec[i] == jedec_id)
			break;
	}

	if (flash_32m_jedec[i] != jedec_id)
	{
		iounmap(ath79_spi_base);
		return (u8 *) KSEG1ADDR(0x1fff1000);
	}

	ath79_flash_read(0x01ff0000, 0x10000, ath79_eeprom);

	iounmap(ath79_spi_base);
	return (u8 *) ((u32) ath79_eeprom + 0x1000);
}
