/*****************************************************************************
* $File:   watchdog.c
*
* $Author: Hua Shao
* $Date:   Feb, 2014
*
* The dog needs feeding.......
*
*****************************************************************************/

#include <errno.h>
#include <fcntl.h>
#include <sched.h>
#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

int fd = 0;
static int _running = 1;
void sigterm_handler(int arg) {
    _running = 0;
}

#if 0
#define TRACCCE(...) printf("%s(), L%d.\n", __FUNCTION__, __LINE__)
#else
#define TRACCCE()
#endif


int main(int argc, char *const argv[])
{
    TRACCCE();

    /* open the device */
    fd = open("/dev/watchdog", O_WRONLY);
    if ( fd == -1 )
    {
        TRACCCE();
        exit(1);
    }

    TRACCCE();
    /* set signal term to call sigterm_handler() */
    /* to make sure fd device is closed */
    signal(SIGTERM, sigterm_handler);

    /* main loop: feeds the dog every <tint> seconds */
    while(_running)
    {
        if(write(fd, "\0", 1)<0)
        {
            TRACCCE();
        }
        TRACCCE();
        sleep(1);
    }

    if (close(fd) == -1)
    {
        TRACCCE();
    }
}


