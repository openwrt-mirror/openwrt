#include <string>
#include "polarssl/ssl.h"
#if WIN32
#include <windows.h>
#else
#include <arpa/inet.h>
#include <errno.h>
typedef long long __int64;
#endif
#include "bytestool.h"
#include "sendmsg.h"
#include<stdlib.h>
using namespace std;


#if WIN32

#else
void milliseconds_sleep( unsigned long mSec )
{
    struct timeval tv;
    tv.tv_sec   = mSec / 1000;
    tv.tv_usec  = (mSec % 1000) * 1000;
    int err;
    do
    {
        err = select( 0, NULL, NULL, NULL, &tv );
    }
    while ( err < 0 && errno == EINTR );
}
#endif

int strpos( char *str, char c )
{
	char *sc = strchr( str, c );
	if ( sc == NULL )
		return(-1);
	return(sc - str);
}

void sleeps(int ti)
{
    #if WIN32
        Sleep( ti);
#else
        milliseconds_sleep( ti);
#endif

}

char *random_uuid( char buf[37] )
{
    srand((unsigned) time(NULL));
    const char *c = "89ab";
    char *p = buf;
    int n;
    for( n = 0; n < 16; ++n )
    {
        int b = rand()%255;
        switch( n )
        {
            case 6:
                sprintf(p, "4%x", b%15 );
            break;
            case 8:
                sprintf(p, "%c%x", c[rand()%strlen(c)], b%15 );
            break;
            default:
                sprintf(p, "%02x", b);
            break;
        }

        p += 2;

        switch( n )
        {
            case 3:
            case 5:
            case 7:
            case 9:
                break;
        }
    }
    *p = 0;
    return buf;
}

int SendAuth(ssl_context *ssl,string ClientId,string user)
{
    string str="{\"Type\":\"Auth\",\"Payload\":{\"Version\":\"2\",\"MmVersion\":\"1.7\",\"User\":\""+user+"\",\"Password\": \"\",\"OS\":\"darwin\",\"Arch\":\"amd64\",\"ClientId\":\""+ClientId+"\"}}";
   // printf( "SendAuthstr:%s\r\n",str.c_str());
    unsigned char buffer[str.length()+9];
    int sendlen=pack(buffer,str);
    int len=ssl_write(ssl, buffer, sendlen);
    return len;
}

int SendRegProxy(ssl_context *ssl,string ClientId)
{
    string str="{\"Type\":\"RegProxy\",\"Payload\":{\"ClientId\":\""+ClientId+"\"}}";
    //printf( "SendRegProxystr:%s\r\n",str.c_str());
    unsigned char buffer[str.length()+9];
    int sendlen=pack(buffer,str);
    int len=ssl_write( ssl, buffer, sendlen);
    return len;
}

int SendPing(ssl_context *ssl)
{
   	string str="{\"Type\":\"Ping\",\"Payload\":{}}";
   	unsigned char buffer[str.length()+9];
    int sendlen=pack(buffer,str);
    int len=ssl_write(ssl,buffer,sendlen);
    return len;
}

int SendReqTunnel(ssl_context *ssl,string protocol,string HostName,string Subdomain,int RemotePort)
{
    char RemotePortStr[10];
    sprintf(RemotePortStr,"%d",RemotePort);
    char guid[37];
    random_uuid(guid);
    guid[9]='\0';
    string guid_str=string(guid);
    string str="{\"Type\":\"ReqTunnel\",\"Payload\":{\"Protocol\":\""+protocol+"\",\"ReqId\":\""+guid_str+"\",\"Hostname\": \""+HostName+"\",\"Subdomain\":\""+Subdomain+"\",\"HttpAuth\":\"\",\"RemotePort\":"+string(RemotePortStr)+"}}";
    //printf("SendReqTunnelstr:%s\r\n",str.c_str());
    unsigned char buffer[str.length()+9];
    int sendlen=pack(buffer,str);
    int len=ssl_write(ssl, buffer,sendlen);
    return len;
}


int SendPong(ssl_context *ssl)
{
   	string str="{\"Type\":\"Pong\",\"Payload\":{}}";
   	unsigned char buffer[str.length()+9];
    int sendlen=pack(buffer,str);
    int len=ssl_write( ssl, buffer, sendlen);
    return len;
}

int pack(unsigned char * buffer,string msgstr)
{
    #if WIN32
    unsigned __int64 packlen;
    #else
    unsigned long long packlen;
    #endif
    packlen=msgstr.length();
    if(BigEndianTest()==BigEndian)
    {
        packlen=LittleEndian_64(packlen);
    }
    memcpy(buffer,&packlen,8);
    memcpy(buffer+8,msgstr.c_str(), msgstr.length());
    return  8+msgstr.length();
}


int readlen(ssl_context *ssl,unsigned char *buffer, int readlen,int bufferlen)
{
    int recvlen = 0;
    int len;
    memset( buffer, 0, bufferlen);
    while ( 1 )
    {
        if ( (readlen - recvlen) < 1 )
        {
            break;
        }
        len = ssl_read( ssl, buffer+recvlen, (readlen - recvlen) );
        if ( len > 0 )
        {
            recvlen = recvlen + len;
        }else    {
            break;
        }
        sleeps(1);
    }
    return recvlen;
}

int get_curr_unixtime()
{
    time_t now;
    int unixtime = time(&now);
    return unixtime;
}


int getlocaladdr( map<string,TunnelInfo *> *tunnellist,char *url, struct sockaddr_in* local_addr )
{
	char	Protocol[10]	= { 0 };
	int	plen		= strpos( url, ':' );
	memcpy( Protocol, url, plen );
	if ( tunnellist->count( string( Protocol ) ) > 0 )
	{
		TunnelInfo	*tunnelinfo	= (*tunnellist)[string( Protocol )];


		int		l1		= inet_addr( tunnelinfo->localhost );
		printf( "tunnelinfo->localhost %s\r\n", tunnelinfo->localhost );
		printf( "tunnelinfo->localhost \r\n" );
		local_addr->sin_family	= AF_INET;
		local_addr->sin_port	= htons(tunnelinfo->localport );
		memcpy( &local_addr->sin_addr, &l1, 4 );
		return 0;
	}
	return -1;
}

int GetProtocol(char *url,char *Protocol)
{
	int	plen= strpos( url, ':' );
	if(plen>0)
    {
        memcpy( Protocol, url, plen );
        return 0;
    }
	return -1;
}


int loadargs( int argc, char **argv ,map<string, TunnelInfo*>*tunnellist,char *s_name,int * s_port,char * authtoken)
{
	if ( argc > 1 )
	{
		char	jsonstr[1024];
		char	temp[255];
		int	pos	= 0;
		char *argvstr;
		int	xpos;
		int	ypos;
		int	run = 1;
		for ( int i = 1; i < argc; i++ )
		{
			argvstr = argv[i];
			memset( jsonstr, 0, 1024 );
			pos = strpos( argvstr, '[' );
			if ( pos == -1 )
			{
				printf( "argv error:%s", argvstr );
			}else  {
				if ( strncmp( argvstr, "-SER", 4 ) == 0 )
				{
					run = 1;
					while ( run )
					{
						memset( jsonstr, 0, 1024 );
						xpos = strpos( argvstr + pos + 1, ',' );
						if ( xpos == -1 )
						{
							xpos = strpos( argvstr + pos + 1, ']' );
							memcpy( jsonstr, argvstr + pos + 1, xpos );
							run = 0;
						}else  {
							memcpy( jsonstr, argvstr + pos + 1, xpos );
						}


						if ( strncmp( jsonstr, "Shost", 5 ) == 0 )
						{
							ypos = strpos( jsonstr, ':' );
							if ( ypos != -1 )
							{
								memset( s_name, 0, strlen( s_name ) );
								memcpy( s_name, jsonstr + ypos + 1, strlen( jsonstr + ypos ) );
							}
						}

						if ( strncmp( jsonstr, "Sport", 5 ) == 0 )
						{
							ypos = strpos( jsonstr, ':' );
							if ( ypos != -1 )
							{
								memset( temp, 0, strlen( temp ) );
								memcpy( temp, jsonstr + ypos + 1, strlen( jsonstr + ypos ) );
								*s_port = atoi( temp );
							}
						}

						if ( strncmp( jsonstr, "Atoken", 6 ) == 0 )
						{
							ypos = strpos( jsonstr, ':' );
							if ( ypos != -1 )
							{
								memset( authtoken, 0, strlen( authtoken ) );
								memcpy( authtoken, jsonstr + ypos + 1, strlen( jsonstr + ypos ) );
							}
						}
						pos = pos + xpos + 1;
					}
				}

				if ( strncmp( argvstr, "-AddTun", 7 ) == 0 )
				{
					run = 1;

					TunnelInfo *tunnelinfo = (TunnelInfo *) malloc( sizeof(TunnelInfo) );
					memset( tunnelinfo, 0, sizeof(TunnelInfo) );
					char Type[255] = { 0 };

					while ( run )
					{
						memset( jsonstr, 0, 1024 );
						xpos = strpos( argvstr + pos + 1, ',' );
						if ( xpos == -1 )
						{
							xpos = strpos( argvstr + pos + 1, ']' );
							memcpy( jsonstr, argvstr + pos + 1, xpos );
							run = 0;
						}else  {
							memcpy( jsonstr, argvstr + pos + 1, xpos );
						}


						if ( strncmp( jsonstr, "Type", 4 ) == 0 )
						{
							ypos = strpos( jsonstr, ':' );
							if ( ypos != -1 )
							{
								memcpy( Type, jsonstr + ypos + 1, strlen( jsonstr + ypos ) );
							}
						}

						if ( strncmp( jsonstr, "Lhost", 5 ) == 0 )
						{
							ypos = strpos( jsonstr, ':' );
							if ( ypos != -1 )
							{
								memcpy( tunnelinfo->localhost, jsonstr + ypos + 1, strlen( jsonstr + ypos ) );
							}
						}
						if ( strncmp( jsonstr, "Lport", 5 ) == 0 )
						{
							ypos = strpos( jsonstr, ':' );
							if ( ypos != -1 )
							{
								memset( temp, 0, strlen( temp ) );
								memcpy( temp, jsonstr + ypos + 1, strlen( jsonstr + ypos ) );
								tunnelinfo->localport = atoi( temp );
							}
						}

						if ( strncmp( jsonstr, "Rport", 5 ) == 0 )
						{
							ypos = strpos( jsonstr, ':' );
							if ( ypos != -1 )
							{
								memset( temp, 0, strlen( temp ) );
								memcpy( temp, jsonstr + ypos + 1, strlen( jsonstr + ypos ) );
								tunnelinfo->remoteport = atoi( temp );
							}
						}

						if ( strncmp( jsonstr, "Sdname", 6 ) == 0 )
						{
							ypos = strpos( jsonstr, ':' );
							if ( ypos != -1 )
							{
								memcpy( tunnelinfo->subdomain, jsonstr + ypos + 1, strlen( jsonstr + ypos ) );
							}
						}
						if ( strncmp( jsonstr, "Hostname", 8 ) == 0 )
						{
							ypos = strpos( jsonstr, ':' );
							if ( ypos != -1 )
							{
								memcpy( tunnelinfo->hostname, jsonstr + ypos + 1, strlen( jsonstr + ypos ) );
							}
						}

						pos = pos + xpos + 1;
					}



                    int		l1		= inet_addr( tunnelinfo->localhost );
                    (&tunnelinfo->local_addr)->sin_family	= AF_INET;

                     (&tunnelinfo->local_addr)->sin_port	= htons(tunnelinfo->localport );
                     memcpy(&(&tunnelinfo->local_addr)->sin_addr, &l1, 4 );
                   //  printf("sdfsd\r\n");
					(*tunnellist)[string( Type )] = tunnelinfo;
				}
			}
		}
	}else  {
		printf( "use " );
        printf("%s",argv[0]);
		printf( " -SER[Shost:ngrokd.ngrok.com,Sport:443,Atoken:xxxxxxx] -AddTun[Type:tcp,Lhost:127.0.0.1,Lport:80,Rport:50199]" );
		printf( "\r\n" );
		exit( 1 );
	}
	return 0;
}

