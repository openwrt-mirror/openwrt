#define AR71XX_SPI_CLK_HIGH	(1<<8)
#define AR71XX_SPI_CS_DIS	(AR71XX_SPI_IOC_CS_ALL)
#define AR71XX_SPI_CE_LOW	(AR71XX_SPI_IOC_CS1 | AR71XX_SPI_IOC_CS2)
#define AR71XX_SPI_CE_HIGH	(AR71XX_SPI_CE_LOW | AR71XX_SPI_CLK_HIGH)

#define OPCODE_READ		0x03
#define OPCODE_WREN		0x06
#define OPCODE_WREAR		0xc5
#define OPCODE_RSTEN		0x66
#define OPCODE_RESET		0x99
#define OPCODE_RDID		0x9f

#define ath79_spi_read(_phys)		__raw_readl(ath79_spi_base + (_phys))
#define ath79_spi_write(_phys, _val)	__raw_writel((_val), ath79_spi_base + (_phys))

#define ath79_be_msb(_val, _i) (((_val) & (1 << (7 - _i))) >> (7 - _i))


#define ath79_spi_bit_banger(_byte) do \
	{ \
		int i; \
		for(i = 0; i < 8; i++) \
		{ \
			ath79_spi_write(AR71XX_SPI_REG_IOC, \
				AR71XX_SPI_CE_LOW | ath79_be_msb(_byte, i)); \
			ath79_spi_write(AR71XX_SPI_REG_IOC, \
				AR71XX_SPI_CE_HIGH | ath79_be_msb(_byte, i)); \
		} \
	} while(0)


#define ath79_spi_go() do \
	{ \
		ath79_spi_write(AR71XX_SPI_REG_IOC, AR71XX_SPI_CE_LOW); \
		ath79_spi_write(AR71XX_SPI_REG_IOC, AR71XX_SPI_CS_DIS); \
	} while(0)


#define ath79_spi_send_instruction(_byte) do \
	{ \
		ath79_spi_bit_banger(_byte); \
		ath79_spi_go(); \
	} while(0)


#define ath79_spi_send_addr(_addr) do \
	{ \
		ath79_spi_bit_banger(((_addr & 0xff0000) >> 16)); \
		ath79_spi_bit_banger(((_addr & 0xff00) >> 8)); \
		ath79_spi_bit_banger(_addr & 0xff); \
	} while(0)


#define ath79_spi_delay_8()	ath79_spi_bit_banger(0)

#define ath79_spi_deselect()	ath79_spi_write(AR71XX_SPI_REG_IOC, AR71XX_SPI_CS_DIS)

#define ath79_spi_start()	ath79_spi_write(AR71XX_SPI_REG_FS, 1)

#define ath79_spi_done()	ath79_spi_write(AR71XX_SPI_REG_FS, 0)

u8 *ath79_get_eeprom(void);
