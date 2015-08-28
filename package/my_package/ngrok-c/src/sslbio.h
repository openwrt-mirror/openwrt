#ifndef SSLBIO_H_INCLUDED
#define SSLBIO_H_INCLUDED
#include<malloc.h>
#include <polarssl/net.h>
#include <polarssl/debug.h>
#include <polarssl/ssl.h>
#include <polarssl/entropy.h>
#include <polarssl/ctr_drbg.h>
#include <polarssl/error.h>
#include <polarssl/certs.h>
#include "sendmsg.h"

struct ssl_info
{
    entropy_context entropy;
    ctr_drbg_context ctr_drbg;
    ssl_context ssl;
    ssl_session ssn;
    x509_crt cacert;
};
int ssl_init_info(int *server_fd,ssl_info *sslinfo);
int ssl_free_info(ssl_info *sslinfo);
#endif // SSLBIO_H_INCLUDED
