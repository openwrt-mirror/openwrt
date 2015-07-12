#include "nonblocking.h"
int setnonblocking(int sServer,int _nMode)
{
    #if WIN32
    DWORD nMode = _nMode;
    return ioctlsocket( sServer, FIONBIO,&nMode);
    #else
    if(_nMode==1)
    {
       return fcntl(sServer,F_SETFL,O_NONBLOCK);
    }
    else
    {
      return fcntl(sServer,F_SETFL, _nMode);
    }
    #endif
}

void clearsock(int sock,sockinfo * sock_info)
{

      if(sock_info->istype==1)
      {
            if(sock_info->packbuflen>0&&sock_info->packbuf!=NULL)
           {
              free(sock_info->packbuf);
              sock_info->packbuf=NULL;
           }

          if(sock_info->sslinfo!=NULL)
          {
            //linux error
              ssl_close_notify(&sock_info->sslinfo->ssl);
              ssl_free_info(sock_info->sslinfo);
              free(sock_info->sslinfo);
              sock_info->sslinfo=NULL;
          }
      }
      net_close(sock);
      //ÊÍ·ÅÄÚ´æ
      if(sock_info!=NULL)
      {
        free(sock_info);
        sock_info=NULL;
      }

}


int check_sock(int sock)
{
    int error=-1;
    #if WIN32
    int len ;
    #else
    socklen_t len;
    #endif
    len = sizeof(error);
    getsockopt(sock, SOL_SOCKET, SO_ERROR, (char*)&error, &len);
    return error;
}

/*清理sock列表*/
int clensocklist(list<int> *clearsocklist,map<int, sockinfo*>	*socklist,pthread_mutex_t *mutex,int iserr )
{
	map<int, sockinfo*>::iterator it;
	for ( it = socklist->begin(); it != socklist->end(); ++it )
	{
		if ( iserr == 0 )
		{
			clearsock( it->first, it->second );
			clearsocklist->push_back( it->first );
			continue;
		}else  {
			if ( check_sock( it->first ) != 0 )
			{
				sockinfo *addtempinfo = it->second;
				if ( addtempinfo->isconnect == 1 )
				{
					clearsock( it->first, addtempinfo );
					clearsocklist->push_back( it->first );
					continue;
				}
			}
		}
	}
	/* 清空 */
	clearlist(clearsocklist,socklist,mutex);
	return(0);
}

int clearlist(list<int> *clearsocklist,map<int, sockinfo*>	*socklist,pthread_mutex_t *mutex)
{
	list<int>::iterator v;
	for ( v = clearsocklist->begin(); v != clearsocklist->end(); ++v )
	{
		pthread_mutex_lock( mutex );
        socklist->erase( *v );
		pthread_mutex_unlock( mutex );
	}
	clearsocklist->clear();
	return 0;
}

int net_dns( struct sockaddr_in *server_addr, const char *host, int port )
{
    struct hostent *server_host;
    if((server_host = gethostbyname(host)) == NULL )
    {
        return -1;
    }
    memcpy((void*)&server_addr->sin_addr,(void*)server_host->h_addr,server_host->h_length);
    server_addr->sin_family = AF_INET;
    server_addr->sin_port   = htons( port );
    return 0;
}
