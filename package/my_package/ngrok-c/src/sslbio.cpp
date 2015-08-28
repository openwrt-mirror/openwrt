#include "sslbio.h"

int ssl_init_info(int *server_fd,ssl_info *sslinfo)
{
    int ret;
    const char *pers = "ssl";
    x509_crt_init(&sslinfo->cacert );
    entropy_init(&sslinfo->entropy );
    if( ( ret = ctr_drbg_init( &sslinfo->ctr_drbg, entropy_func, &sslinfo->entropy,
                               (const unsigned char *) pers,
                               strlen( pers ) ) ) != 0 )
    {

        return -1;
    }
    if( ( ret = ssl_init( &sslinfo->ssl ) ) != 0 )
    {
        printf( " failed\n  ! ssl_init returned %d\n\n", ret );
        return -1;
    }

    ssl_set_endpoint( &sslinfo->ssl, SSL_IS_CLIENT );
    ssl_set_authmode( &sslinfo->ssl, SSL_VERIFY_OPTIONAL );
    ssl_set_ca_chain( &sslinfo->ssl, &sslinfo->cacert, NULL, "" );
    ssl_set_rng( &sslinfo->ssl, ctr_drbg_random, &sslinfo->ctr_drbg );
    ssl_set_bio( &sslinfo->ssl, net_recv, server_fd,net_send, server_fd );

    while((ret = ssl_handshake(&sslinfo->ssl))!=0)
    {
        if( ret != POLARSSL_ERR_NET_WANT_READ && ret != POLARSSL_ERR_NET_WANT_WRITE )
        {
            printf( " failed\n  ! ssl_handshake returned -0x%x\n\n", -ret );
            return -1;
        }
        //CPU sleep
        sleeps(1);
    }



    if( ( ret = ssl_get_verify_result( &sslinfo->ssl ) ) != 0 )
    {
       // printf( "Verifying peer X.509 certificate...failed \r\n" );
    }
    else
    {
        printf( " ok\n" );
    }
    return 0;
}



int ssl_free_info(ssl_info *sslinfo)
{
    x509_crt_free(&sslinfo->cacert );
    ssl_free(&sslinfo->ssl);
    ctr_drbg_free(&sslinfo->ctr_drbg );
    entropy_free(&sslinfo->entropy );
    return 0;
}
