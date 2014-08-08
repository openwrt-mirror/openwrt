/* ralink-flash.c
 *
 * Steven Liu <steven_liu@ralinktech.com.tw>:
 *   - initial approach
 *
 * Winfred Lu <winfred_lu@ralinktech.com.tw>:
 *   - 32MB flash support for RT3052
 *   - flash API
 */

#include <linux/module.h>
#include <linux/types.h>
#include <linux/init.h>
#include <linux/kernel.h>
#include <linux/err.h>

#include <linux/slab.h>
#include <asm/io.h>
#include <linux/mtd/mtd.h>
#include <linux/mtd/map.h>
#include <linux/mtd/concat.h>
#include <linux/mtd/partitions.h>
#include <asm/addrspace.h>
#include "ralink-flash.h"
#include "rt_mmap.h"

//fix
#include <linux/delay.h>
#include <linux/sched.h>
#include <linux/backing-dev.h>
#include <linux/compat.h>
#include <linux/mount.h>
#include <asm/io.h>
//fix
struct proc_dir_entry *procRegDir;

/*
 * Flash API: ra_mtd_read, ra_mtd_write
 * Arguments:
 *   - num: specific the mtd number
 *   - to/from: the offset to read from or written to
 *   - len: length
 *   - buf: data to be read/written
 * Returns:
 *   - return -errno if failed
 *   - return the number of bytes read/written if successed
 */
int ra_mtd_write_nm(char *name, loff_t to, size_t len, const u_char *buf)
{
	int ret = -1;
	size_t rdlen, wrlen;
	struct mtd_info *mtd;
	struct erase_info ei;
	u_char *bak = NULL;
        DECLARE_WAITQUEUE(wait, current);                                                                                                   
        wait_queue_head_t wait_q;

	mtd = get_mtd_device_nm(name);

	if (IS_ERR(mtd)) {
		ret = (int)mtd;
		goto out;
	}

	if (len > mtd->erasesize) {
		put_mtd_device(mtd);
		ret = -E2BIG;
		goto out;
	}

	bak = kzalloc(mtd->erasesize, GFP_KERNEL);
	if (bak == NULL) {
		put_mtd_device(mtd);
		ret = -ENOMEM;
		goto out;
	}

        set_current_state(TASK_INTERRUPTIBLE);
        add_wait_queue(&wait_q, &wait);

	ret = mtd->_read(mtd, 0, mtd->erasesize, &rdlen, bak);
	if (ret) {
                set_current_state(TASK_RUNNING);
                remove_wait_queue(&wait_q, &wait);
		put_mtd_device(mtd);
		goto free_out;
	}

        schedule();  /* Wait for write to finish. */                                                                                
        remove_wait_queue(&wait_q, &wait);                                                                                          

	if (rdlen != mtd->erasesize)
		printk("warning: ra_mtd_write: rdlen is not equal to erasesize\n");

	memcpy(bak + to, buf, len);

	ei.mtd = mtd;
	ei.callback = NULL;
	ei.addr = 0;
	ei.len = mtd->erasesize;
	ei.priv = 0;
	ret = mtd->_erase(mtd, &ei);
	if (ret != 0) {
		put_mtd_device(mtd);
		goto free_out;
	}

        set_current_state(TASK_INTERRUPTIBLE);
        add_wait_queue(&wait_q, &wait);

	ret = mtd->_write(mtd, 0, mtd->erasesize, &wrlen, bak);

        schedule();  /* Wait for write to finish. */                                                                                
        remove_wait_queue(&wait_q, &wait);                                                                                          

	udelay(3000); //add 3ms delay after write

	put_mtd_device(mtd);

free_out:
	kfree(bak);
out:
	return ret;
}

int ra_mtd_read_nm(char *name, loff_t from, size_t len, u_char *buf)
{
	int ret;
	size_t rdlen;
	struct mtd_info *mtd;

	mtd = get_mtd_device_nm(name);
	if (IS_ERR(mtd))
		return (int)mtd;

	ret = mtd->_read(mtd, from, len, &rdlen, buf);
	if (rdlen != len)
		printk("warning: ra_mtd_read_nm: rdlen is not equal to len\n");

	udelay(1000); //add 1ms delay after read

	put_mtd_device(mtd);
	return ret;
}
//fix
EXPORT_SYMBOL(procRegDir);
EXPORT_SYMBOL(ra_mtd_write_nm);
EXPORT_SYMBOL(ra_mtd_read_nm);
//fix

MODULE_AUTHOR("Steven Liu <steven_liu@ralinktech.com.tw>");
MODULE_DESCRIPTION("Ralink APSoC Flash Map");
MODULE_LICENSE("GPL");
