/* ------------------------ usrinc/plugin.h ------------------- */
/*                                                              */
/*              Copyright (c) 2018 TmaxSoft Co., Ltd            */
/*                   All Rights Reserved                        */
/*                                                              */
/* ------------------------------------------------------------ */

#ifndef _WEBTOB_PLUGIN_H
#define _WEBTOB_PLUGIN_H

#include "wintypes.h"

#define SF_MAX_PLUGIN_DESC_LEN 257

#define HTTP_PLUGIN_MAJOR       2
#define HTTP_PLUGIN_MINOR       0
#define HTTP_PLUGIN_REVISION  MAKELONG( HTTP_PLUGIN_MINOR, HTTP_PLUGIN_MAJOR );

/* for plugin version */
typedef struct _HTTP_PLUGIN_VERSION
{
  DWORD dServerPluginVersion;  /* server plugin version */
  DWORD dPluginVersion;        /* plugin version by set plugin(so) */
  CHAR  sPluginDesc[SF_MAX_PLUGIN_DESC_LEN+1];
} HTTP_PLUGIN_VERSION, *PHTTP_PLUGIN_VERSION;

/* context for wbevent
 * event callback function? 
 *   -> ev_callback(LPVOID ev, void *arg) */
typedef struct _WB_EVENT_CONTEXT
{
  /* allocate event */
  LPVOID (WINAPI * wbevAlloc)
    (DWORD   dSocketChannel); /* socket(fd) */

  /* free event */
  BOOL (WINAPI * wbevFree)
    (LPVOID  lpvWbev);        /* wb event pointer */

  /* set(register) read event */
  BOOL (WINAPI * wbevSetRead)
    (LPVOID  lpvWbev,         /* wb event pointer */
     LPVOID  lpvCallbackFunc, /* ev_callback(LPVOID ev, void *arg) */
     LPVOID  lpvCallbackArg); /* void *arg */

  /* set(register) write event */
  BOOL (WINAPI * wbevSetWrite)
    (LPVOID  lpvWbev,         /* wb event pointer */
     LPVOID  lpvCallbackFunc, /* ev_callback(LPVOID ev, void *arg) */
     LPVOID  lpvCallbackArg); /* void *arg */

  /* clear(unregister) read event */
  BOOL (WINAPI * wbevClearRead)
    (LPVOID  lpvWbev);        /* wb event pointer */

  /* clear(unregister) write event */
  BOOL (WINAPI * wbevClearWrite)
    (LPVOID  lpvWbev);        /* wb event pointer */

} WB_EVENT_CONTEXT, *PWB_EVENT_CONTEXT;

/* context for common(memory, schedule) function
 * if *NODE.DebugHthMemory=Y & wsadmin's hthmem command
 * return used memory info file.
 */
typedef struct _WB_COMFUNC_CONTEXT
{
  /* allocate memory */
  LPVOID (WINAPI * wbmemAlloc)
    (DWORD  dSize);

  /* free memory */
  LPVOID (WINAPI * wbmemFree)
    (LPVOID lpvPtr);

  /* set next schedule time */
  DWORD  (WINAPI * wbscheduleTime)
    (DWORD dNextScheduleTime);

  /* manage(send) plugin message to other HTHs */
  DWORD  (WINAPI * messageDistribute)
    (LPVOID lpvPtr,
     DWORD  dSize);

} WB_COMFUNC_CONTEXT, *PWB_COMFUNC_CONTEXT;

/* context for HTTP request info */
typedef struct _WB_HTTP_REQ_CONTEXT {
  DWORD  dSize;           /* the size of this structure */
#define  PG_REQ_STATUS_NOT_READY   0
#define  PG_REQ_STATUS_READY       1
#define  PG_REQ_STATUS_RUNNING     2
#define  PG_REQ_STATUS_CLIENT_END  3
  DWORD  dStatus;          /* processing status */

  /* request unique? webtobip + hthno + clientno + seqno (+ streamid) */
  DWORD  dClientno;        /* current client no(index) */
  DWORD  dReq_sequence;    /* current request sequence */
  DWORD  dReq_streamid;    /* current request streamid (for http2; default 1 in http1) */
  DWORD  dReq_bodysize;    /* current request body size */
  DWORD  dReq_hdrcount;    /* current request header count */
  LPVOID lpvReqHeaders;    /* reserved for all request headers */

  DWORD  dRevision;        /* the revision number of this structure */
  LPVOID lpvClientContext; /* reserved for server use */
  BOOL   bIsSecurePort;    /* True if the connection is on a secure port */
  DWORD  dHttpStatus;      /* For SEND_RESPONSE */ 
} WB_HTTP_REQ_CONTEXT, *PWB_HTTP_REQ_CONTEXT;

/* context for managing HTTP request/response  */
typedef struct _WB_HTTPFUNC_CONTEXT
{
  /* get Server variable */
  BOOL (WINAPI * GetServerVariable)
    (PWB_HTTP_REQ_CONTEXT prc, /* request context */
     LPSTR    lpsVariableName, /* variable name */
     LPVOID   lpvBuffer,       /* buffer */
     LPDWORD  lpdSize);        /* buffer size */

  /* get Request Header/Body */
  BOOL (WINAPI * GetHeader)
    (PWB_HTTP_REQ_CONTEXT prc, /* request context */
     LPSTR    lpsName,         /* header name */
     LPVOID   lpvBuffer,       /* buffer */
     LPDWORD  lpdSize);        /* buffer size */

  /* get All Request Header Name
   * (LPSTR = char *)
   * ex) LPSTR = pointer("Host:Accept:User-Agent:Custom-Header:")
   *     lpdSize = 37 (strlen(LPSTR))
   * LPSTR is freed by handler, plugin don't have to free.
   *
   * return
   *   pointer of request Headers, lpdSize
   *   if lpdSize exists,
   *   then -1 on error, else length of request Headers
   */
  LPSTR (WINAPI * GetAllHeaders)
    (PWB_HTTP_REQ_CONTEXT prc, /* request context */
     LPDWORD  lpdSize);        /* buffer size */

  /* add Response Header */
  BOOL (WINAPI * AddResponseHeaders)
    (PWB_HTTP_REQ_CONTEXT prc, /* request context */
     LPSTR    lpsHeaders);     /* header ("key: value") */

  /* send Response: set status to request context's dHttpStatus */
  BOOL (WINAPI * SendResponse)
    (PWB_HTTP_REQ_CONTEXT prc, /* request context */
     LPVOID   lpvData,         /* body data */
     DWORD    dSize,           /* body data size */
     LPVOID   lpvContentType); /* content type */
     /* 
      * if (prc->dHttpStatus == 300) {
      *   lpvData must include routing info
      *   ex) api_name@svrgroupname,addr1,addr2,..@backendPath@auth_info
      *       (addrSeperator: ',' otehrSeperator: '@')
      *   ->  testAPI@svg1,http://ip:port1,https://ip:port2@/test@user:iam
      * }
      * else {
      *   lpvData may include response body
      * }
      */

  /* send Websocket msg: set User and Data */
  BOOL (WINAPI * SendWebsocketMsg)
    (LPVOID   lpvUser,         /* user info */
     DWORD    dUserSize,       /* user info's size */
     LPVOID   lpvData,         /* data(websocket msg) */
     DWORD    dDataSize);      /* data's size */
     /* 
      * ex) User: "id1,id2,id3" (seperator: ',')
      *     Data: "websocket push message"
      */

} WB_HTTPFUNC_CONTEXT, *PWB_HTTPFUNC_CONTEXT;

/* context for preprocess */
typedef struct _WB_PLUGIN_PREPROC
{
#define PATH_SIZE  256
  DWORD dHthno;                    /* current hth no(index) */
  DWORD dHthpid;                   /* current hth pid(processid)  */
  CHAR  sConfigPath[PATH_SIZE];    /* config path (*PLUGIN.ConfigPath( */

  WB_EVENT_CONTEXT wbev_ctx;      /* event context */
  WB_COMFUNC_CONTEXT wbcom_ctx;   /* common(mem, schedule) function context */
  WB_HTTPFUNC_CONTEXT wbhttp_ctx; /* http function context */

} WB_PLUGIN_PREPROC, *PWB_PLUGIN_PREPROC;


/* for managing plugin version */
extern BOOL WINAPI
GetPluginVersion( HTTP_PLUGIN_VERSION *pVer );

/* for processing PreProcess */
extern BOOL WINAPI
PluginPreProcess( WB_PLUGIN_PREPROC *pPreproc );

/* for processing HTTP request
 * return:
 *  -1 error  : 500 Response will be sent to client by html;
 *   0 skip   : This request will be processed html;
 *   1 success: Plugin must make response body &
 *                          call wbhttp_ctx->SendResponse();
 */  
extern DWORD WINAPI
HttpRequestProcess( WB_HTTP_REQ_CONTEXT *prc, DWORD NotificationType );

/* for premature client disconnection */
extern DWORD WINAPI
HttpClientException( WB_HTTP_REQ_CONTEXT *prc );

/* for ping(heart bit) scheduler, etc */
extern DWORD WINAPI
MessageDistribute( LPVOID mPtr, DWORD dSize );

/* for ping(heart bit) scheduler, etc */
extern DWORD WINAPI
TimerSchedulerProcess();

/* for closing plugin */
extern BOOL WINAPI
TerminatePlugin( DWORD dwFlags );

#endif
