#ifndef NONBLOCKING_H_INCLUDED
#define NONBLOCKING_H_INCLUDED
#if  WIN32
#include <windows.h>
#else
#include <fcntl.h>
#include <netinet/in.h>
#include <netdb.h>
#include <sys/types.h>
#include <sys/socket.h>
#endif
#include <list>


#include "sslbio.h"
using namespace std;
struct sockinfo
{
    ssl_info *sslinfo;
    int isssl;
    int isconnect;
    int linkunixtime;
    int istype; //1=remote 2=local
    int tosock;
    char *packbuf;
    int packbuflen;
    int isconnectlocal;
};
int setnonblocking(int sServer,int _nMode);
int clearlist(list<int> *clearsocklist,map<int, sockinfo*>	*socklist,pthread_mutex_t *mutex);
int clensocklist(list<int> *clearsocklist,map<int, sockinfo*>	*socklist,pthread_mutex_t *mutex,int iserr );
int net_dns( struct sockaddr_in *server_addr, const char *host, int port );
int check_sock(int sock);
void clearsock(int sock,sockinfo * sock_info);
#endif // NONBLOCKING_H_INCLUDED
