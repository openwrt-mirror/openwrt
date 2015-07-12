#include <string.h>
#include <stdio.h>
#include <errno.h>
#include <pthread.h>
#include <map>
#include <list>
#include <iostream>
#include <iomanip>
#include <signal.h>
#include <polarssl/net.h>
#include <polarssl/debug.h>
#include <polarssl/ssl.h>
#include <polarssl/entropy.h>
#include <polarssl/ctr_drbg.h>
#include <polarssl/error.h>
#include <polarssl/certs.h>
#if  WIN32
#include <windows.h>
#else
#include <sys/select.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include <sys/time.h>
#include <fcntl.h>
#include <netinet/in.h>
#include <netdb.h>
#include <arpa/inet.h>
#include <stdlib.h>
#endif

#include "sendmsg.h"
#include "sslbio.h"
#include "cJSON.h"
#include "bytestool.h"
#include "nonblocking.h"


using namespace std;
#define MAXBUF 2048

char s_name[255]="ngrokd.ngrok.com";
int	s_port= 443;
char authtoken[255]="";
string ClientId = "";

int		mainrun		= 0;
int		proxyrun	= 0;
int		pingtime	= 0;
int		pongtime	= 0;
int		ping		= 25;
int		linktime	= 45;
int		mainsock;
int		lastdnstime;
int		lastdnsback;
int     isauth=0;

ssl_info *mainsslinfo;
void* sockmain( void *arg );
void* proxy( void *arg );

struct sockaddr_in server_addr = { 0 };
pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;

map<int,sockinfo*>socklist;
map<string,TunnelInfo*>tunnellist;
map<string,int>tunneloklist;
list<int>clearsocklist;

void cs( int n )
{
	if(n == SIGINT )
	{
		printf( "key down ctrl+c\r\n" );
		exit( 0 );
	}
}








#if WIN32
void* regkey( void *arg )
{
	MSG msg = { 0 };
	/* if (RegisterHotKey(NULL, 1, MOD_CONTROL | MOD_ALT, 'Z')) */
	if ( RegisterHotKey( NULL, 1, MOD_CONTROL, 'Q' ) )
	{
		printf( "reghotkey [Ctrl  + Q] ok!\n" );
	}else  {
		printf( "reghotkey [Ctrl  + Q] err!\n" );
	}


	while ( GetMessage( &msg, NULL, 0, 0 ) )
	{
		if ( WM_HOTKEY == msg.message )
		{
			/* if(1 == msg.wParam && (MOD_CONTROL | MOD_ALT) == LOWORD(msg.lParam) && 'Z' == HIWORD(msg.lParam)) */
			if ( 1 == msg.wParam && (MOD_CONTROL) == LOWORD( msg.lParam ) && 'Q' == HIWORD( msg.lParam ) )
			{
				map<int, sockinfo*>::iterator it;
				for ( it = socklist.begin(); it != socklist.end(); ++it )
				{
					sockinfo *addtempinfo = it->second;
					printf( "listsock:%d type:%d isconnect:%d isconnectlocal:%d\r\n", it->first, addtempinfo->istype, addtempinfo->isconnect, addtempinfo->isconnectlocal );
				}
			}
		}
	}
	return(0);
}
#endif


int CheckStatus()
{
    TunnelInfo	*tunnelinfo;
	if ( proxyrun == 0 )
	{
		proxyrun = 1;
		pthread_t tproxy;
		pthread_create(&tproxy,NULL,&proxy,NULL);
	}
	if ( mainrun == 0 )
	{
		pthread_t tmain;
		pthread_create(&tmain,NULL,&sockmain,NULL);
	}else  {
		int sendlen = SendPing( &mainsslinfo->ssl );
		if ( sendlen < 1 || (pongtime < (pingtime - 35) && pingtime != 0) )
		{
			shutdown( mainsock, 2 );
			mainrun = 0;
		}
		pingtime = get_curr_unixtime();
	}
	//sleep 3ms
    sleeps(3000);
	//检查是否
	if(mainrun==1&&isauth==1)
    {
          /* 遍历添加 */
          map<string, TunnelInfo*>::iterator it;
          for ( it = tunnellist.begin(); it != tunnellist.end(); ++it )
          {
              if(tunneloklist.count(it->first)==0)
              {
                tunnelinfo = it->second;
                SendReqTunnel( &mainsslinfo->ssl, it->first,tunnelinfo->hostname,tunnelinfo->subdomain, tunnelinfo->remoteport );

              }
          }
    }
	return(0);
}


int main( int argc, char **argv )
{
#if WIN32
	pthread_t tregkey;
	pthread_create( &tregkey, NULL, &regkey, NULL );
#endif
	loadargs( argc, argv, &tunnellist, s_name, &s_port, authtoken );
#if WIN32
	signal( SIGINT, cs );
#else
	/* socket close hui fa song xing hao dao zhi tui chu */
	signal( SIGPIPE, SIG_IGN );
	struct sigaction sigIntHandler;
	sigIntHandler.sa_handler = cs;
	sigemptyset( &sigIntHandler.sa_mask );
	sigIntHandler.sa_flags = 0;
	sigaction( SIGINT, &sigIntHandler, NULL );
#endif


#if WIN32
	WSADATA wsaData = { 0 };
	if ( 0 != WSAStartup( MAKEWORD( 2, 2 ), &wsaData ) )
	{
		printf( "WSAStartup failed. errno=[%d]\n", WSAGetLastError() );
		return(-1);
	}
#endif

	/* init addr */
	lastdnsback	= net_dns( &server_addr, s_name, s_port );
	lastdnstime	= get_curr_unixtime();

	while ( true )
	{
		if ( lastdnsback == -1 || (lastdnstime + 600) < get_curr_unixtime() )
		{
			lastdnsback	= net_dns( &server_addr, s_name, s_port );
			lastdnstime	= get_curr_unixtime();
			printf( "update dns\r\n" );
		}
		CheckStatus();
		sleeps( ping * 1000);
	}
	return(0);
}


void* proxy( void *arg )
{
	pthread_detach( pthread_self() );
	fd_set	writeSet;
	fd_set	readSet;

	int		maxfd = 0;
	unsigned char	buf[MAXBUF];
	int		readlen;
	char		tempjson[MAXBUF + 1];
	__int64		packlen;
	struct timeval	timeout;
	int		cunixtime;
	int tcp;
	TunnelInfo	*tunnelinfo	= NULL;
	int		maxfdp		= 0;
	int ret=0;
	char	Protocol[10]	= { 0 };
	while ( proxyrun )
	{
		timeout.tv_sec	= 0;
		timeout.tv_usec = 5000;

		FD_ZERO( &readSet );
		maxfd	= 0;
		maxfdp	= 0;
		FD_ZERO( &writeSet );
		cunixtime = get_curr_unixtime();
		/* 遍历添加 */
		map<int, sockinfo*>::iterator it;
		for ( it = socklist.begin(); it != socklist.end(); ++it )
		{
			sockinfo *addtempinfo = it->second;
			/* 清理超时的错误的链接 */
			if ( addtempinfo->istype == 1 )
			{
				if ( (addtempinfo->linkunixtime + linktime) < cunixtime && addtempinfo->isconnectlocal == 0 )
				{
					clearsock( it->first, it->second );
					clearsocklist.push_back( it->first );
					continue;
				}
			}

			/* 如果未连接才添加，写入监听 */
			if ( addtempinfo->isconnect == 0 )
			{
				FD_SET( it->first, &writeSet );
			}
			FD_SET( it->first, &readSet );

			maxfdp = it->first > maxfdp ? it->first : maxfdp;
			maxfd++;
		}
		/* 循环外移除 */
		clearlist(&clearsocklist,&socklist,&mutex);




		if ( maxfd == 0 )
		{
			sleeps( 500 );
		}

		/*  printf("add ok \r\n"); */
        ret = select( maxfdp + 1, &readSet, &writeSet, NULL, &timeout ); /* 为等待时间传入NULL，则永久等待。传入0立即返回。不要勿用。 */
		if ( ret == -1 && maxfd != 0 )
		{

			/* 清理错误的sock */
			clensocklist( &clearsocklist,&socklist,&mutex,1 );
			continue;
		}
		/*  printf("ret:%d\r\n",ret); */

		if ( ret > 0 )
		{
			map<int, sockinfo*>::iterator it1;
			for ( it1 = socklist.begin(); it1 != socklist.end(); ++it1 )
			{
				if ( FD_ISSET( it1->first, &readSet ) )
				{
					sockinfo *tempinfo1 = it1->second;
					ssl_info *sslinfo1 = tempinfo1->sslinfo;
					if ( tempinfo1->isconnect == 1 )
					{
						/* 远程的转发给本地 */
						if ( tempinfo1->istype == 1 )
						{
							if ( tempinfo1->isconnectlocal == 0 )
							{
								readlen = ssl_read( &sslinfo1->ssl, buf, MAXBUF );
								if ( readlen < 1 )
								{
									clearsock( it1->first, tempinfo1 );
									clearsocklist.push_back( it1->first );
									continue;
								}

								/* copy到临时缓存区 */
								if ( tempinfo1->packbuflen == 0 )
								{
									tempinfo1->packbuf = (char *) malloc( MAXBUF );
								}
								memcpy( tempinfo1->packbuf + tempinfo1->packbuflen, buf, readlen );
								tempinfo1->packbuflen = tempinfo1->packbuflen + readlen;

								/*
								 * 放到数组里面去
								 * EnterCriticalSection(&g_cs);
								 */
								pthread_mutex_lock( &mutex );
								it1->second = tempinfo1;
								pthread_mutex_unlock( &mutex );

								if ( tempinfo1->packbuflen > 8 )
								{
									memcpy( &packlen, tempinfo1->packbuf, 8 );
									if ( BigEndianTest() == BigEndian )
									{
										packlen = Swap64( packlen );
									}
									if ( tempinfo1->packbuflen == packlen + 8 )
									{
										memset( tempjson, 0, 1025 );
										memcpy( tempjson, tempinfo1->packbuf + 8, packlen );
										free( tempinfo1->packbuf );
										tempinfo1->packbuf	= NULL;
										tempinfo1->packbuflen	= 0;
										cJSON	*json	= cJSON_Parse( tempjson );
										cJSON	*Type	= cJSON_GetObjectItem( json, "Type" );
										if ( strcmp( Type->valuestring, "StartProxy" ) == 0 )
										{
											cJSON	*Payload	= cJSON_GetObjectItem( json, "Payload" );
											char	*Url		= cJSON_GetObjectItem( Payload, "Url" )->valuestring;
											GetProtocol( Url, Protocol );
											 /*
											 * 清除
											 */
                                            cJSON_Delete( json );
											if(tunnellist.count( string( Protocol ) ) > 0 )
											{
												tunnelinfo = tunnellist[string( Protocol )];
                                                tcp = socket( AF_INET, SOCK_STREAM, 0 );
                                                if ( connect( tcp, (struct sockaddr *) &tunnelinfo->local_addr, sizeof(tunnelinfo->local_addr) ) == 0 )
                                                {
                                                    setnonblocking( tcp, 1 );
                                                    sockinfo *sinfo = (sockinfo *) malloc( sizeof(sockinfo) );
                                                    sinfo->istype		= 2;
                                                    sinfo->isconnect	= 1;
                                                    sinfo->sslinfo		= sslinfo1;
                                                    sinfo->tosock		= it1->first;
                                                    /* socklist[tcp]=*sinfo; */
                                                    pthread_mutex_lock( &mutex );
                                                    socklist.insert( map<int, sockinfo*> :: value_type( tcp, sinfo ) );
                                                    pthread_mutex_unlock( &mutex );


                                                    /* 远程的带上本地链接 */
                                                    tempinfo1->tosock		= tcp;
                                                    tempinfo1->isconnectlocal	= 1;
                                                    pthread_mutex_lock( &mutex );
                                                    it1->second = tempinfo1;
                                                    pthread_mutex_unlock( &mutex );
                                                }
                                                /* 连接失败 */
                                                else{
                                                    clearsock( it1->first, tempinfo1 );
                                                    clearsocklist.push_back( it1->first );
                                                    continue;
                                                }
											}
										}
									}
								}
							}else  {
								readlen = ssl_read( &sslinfo1->ssl, (unsigned char *) buf, MAXBUF );
								if ( readlen < 1 )
								{
									/* close to sock */
									shutdown( tempinfo1->tosock, 2 );
									clearsock( it1->first, tempinfo1 );
									clearsocklist.push_back( it1->first );
									continue;
								}else  {
									setnonblocking( tempinfo1->tosock, 0 );
#if WIN32
									send( tempinfo1->tosock, (char *) buf, readlen, 0 );
#else
									send( tempinfo1->tosock, buf, readlen, 0 );
#endif                                                                  /* WIN32 */
									setnonblocking( tempinfo1->tosock, 1 );
								}
							}
						}
						/* 本地的转发给远程 */
						else{
#if WIN32
							readlen = recv( it1->first, (char *) buf, MAXBUF, 0 );
#else
							readlen = recv( it1->first, buf, MAXBUF, 0 );
#endif
							if ( readlen > 0 )
							{
								setnonblocking( tempinfo1->tosock, 0 );
								ssl_write( &sslinfo1->ssl, buf, readlen );
								setnonblocking( tempinfo1->tosock, 1 );
							}else  {
								shutdown( tempinfo1->tosock, 2 );
								clearsock( it1->first, tempinfo1 );
								clearsocklist.push_back( it1->first );
								continue;
							}
						}
					}
				}
				if ( FD_ISSET( it1->first, &writeSet ) )
				{
					sockinfo *tempinfo = it1->second;
					if ( tempinfo->isconnect == 0 )
					{
						if ( check_sock( it1->first ) != 0 )
						{
							clearsock( it1->first, tempinfo );
							clearsocklist.push_back( it1->first );
							continue;
						}

						/* 置为1 */
						tempinfo->isconnect = 1;

						/* 为远程连接 */
						if ( tempinfo->istype == 1 )
						{
							ssl_info *sslinfo;
							sslinfo = (ssl_info *) malloc( sizeof(ssl_info) );
							if ( ssl_init_info( (int *) &it1->first, sslinfo ) != -1 )
							{
								tempinfo->sslinfo = sslinfo;
								SendRegProxy( &sslinfo->ssl, ClientId );
								pthread_mutex_lock( &mutex );
								it1->second = tempinfo;
								pthread_mutex_unlock( &mutex );
							}else  {
								printf( "getsockoptclose sock:%d\r\n", it1->first );
								/* ssl 初始化失败，移除连接 */
								clearsock( it1->first, tempinfo );
								clearsocklist.push_back( it1->first );
								continue;
							}
						}else  {
							pthread_mutex_lock( &mutex );
							it1->second = tempinfo;
							pthread_mutex_unlock( &mutex );
						}
					}
				}
			}
			/* 循环外移除 */
			clearlist(&clearsocklist,&socklist,&mutex);
		}
	}
	/* 退出 */
	proxyrun = 0;
	/* 清理全部 */
	clensocklist(&clearsocklist,&socklist,&mutex, 0 );
	return(0);
}


void* sockmain( void *arg )
{
	pthread_detach( pthread_self() );
	if ( mainrun == 1 )
	{
		return(0);
	}else {
		mainrun = 1;
	}

	sockinfo *sinfo;
	int	recvlen;
	cJSON	*json;
	__int64 packlen;
	char	tempjson[MAXBUF + 1];


	unsigned char	buffer[MAXBUF];
	//TunnelInfo	*tunnelinfo;

	mainsock = socket( AF_INET, SOCK_STREAM, IPPROTO_IP );

    mainsslinfo = (ssl_info *) malloc( sizeof(ssl_info) );

	if ( connect( mainsock, (struct sockaddr *) &server_addr, sizeof(server_addr) ) != 0 )
	{
        printf( "connect failed!\r\n" );
		goto exit;
	}

	if(ssl_init_info((int*)&mainsock, mainsslinfo ) == -1 )
	{
		printf( "ssl init failed!\r\n" );
		goto exit;
	}
	SendAuth( &mainsslinfo->ssl, ClientId, "1zW3MqEwX4iHmbtSAk3t" );
	while ( mainrun )
	{
		recvlen = 0;
		packlen = 0;
		memset( tempjson, 0, MAXBUF + 1 );
		recvlen = readlen( &mainsslinfo->ssl, buffer, 8, MAXBUF );
		if ( recvlen == 8 )
		{
			memcpy( &packlen, buffer, 8 );
			if ( BigEndianTest() == BigEndian )
			{
				packlen = Swap64( packlen );
			}
			recvlen = readlen( &mainsslinfo->ssl, buffer, (int) packlen, MAXBUF );
			if ( recvlen == packlen )
			{
				memcpy( tempjson, buffer, packlen );
				printf( "json:%s\r\n", tempjson );
				json = cJSON_Parse( tempjson );
				cJSON *Type = cJSON_GetObjectItem( json, "Type" );
				if ( strcmp( Type->valuestring, "ReqProxy" ) == 0 )
				{
					int proxy_fd = socket( AF_INET, SOCK_STREAM, IPPROTO_IP );
					setnonblocking( proxy_fd, 1 );
					connect( proxy_fd, (struct sockaddr *) &server_addr, sizeof(server_addr) );
					sinfo = (sockinfo *) malloc( sizeof(sockinfo) );
					sinfo->istype		= 1;
					sinfo->isconnect	= 0;
					sinfo->packbuflen	= 0;
					sinfo->sslinfo		= NULL;
					sinfo->linkunixtime	= get_curr_unixtime();
					sinfo->isconnectlocal	= 0;
					pthread_mutex_lock( &mutex );
					socklist.insert( map<int, sockinfo*> :: value_type( proxy_fd, sinfo ) );
					pthread_mutex_unlock( &mutex );
				}
				if ( strcmp( Type->valuestring, "AuthResp" ) == 0 )
				{
					cJSON	*Payload	= cJSON_GetObjectItem( json, "Payload" );
					char	*cid		= cJSON_GetObjectItem( Payload, "ClientId" )->valuestring;
					char	*error		= cJSON_GetObjectItem( Payload, "Error" )->valuestring;
					if(strcmp(error,"")==0)
                    {
                        ClientId = string( cid );
                        SendPing( &mainsslinfo->ssl );
                        isauth=1;
                    }
                    else
                    {
                        cJSON_Delete( json );
                        printf("Auth failed ,Please check authtoken. ");
                        break;
                    }
				}

				if ( strcmp( Type->valuestring, "Ping" ) == 0 )
				{
					SendPong( &mainsslinfo->ssl );
				}
				if ( strcmp( Type->valuestring, "Pong" ) == 0 )
				{
					pongtime = get_curr_unixtime();
				}
				if ( strcmp( Type->valuestring, "NewTunnel" ) == 0 )
				{
					cJSON	*Payload	= cJSON_GetObjectItem( json, "Payload" );
					char	*error		= cJSON_GetObjectItem( Payload, "Error" )->valuestring;
					if(strcmp(error,"")==0)
                    {
                        char	*url		= cJSON_GetObjectItem( Payload, "Url" )->valuestring;
                        char	*protocol	= cJSON_GetObjectItem( Payload, "Protocol" )->valuestring;
                        //
                        tunneloklist[string(protocol)]=1;
                        printf("Add tunnel ok,type:%s url:%s\r\n",protocol,url);
                    }
                    else
                    {
                        printf("Add tunnel failed,%s\r\n",error);
                       // cJSON_Delete( json );
                      //  break;
                    }
				}
				cJSON_Delete( json );
			}else  {
				break;
			}
		}else {
			break;
		}
	}
	ssl_close_notify( &mainsslinfo->ssl );
exit:
	printf( "main thread close \r\n" );
	isauth=0;
	tunneloklist.clear();
	mainrun = 0;
	if ( mainsock != -1 )
		net_close( mainsock );
	ClientId = "";
	free( mainsslinfo );
	return(0);
}
