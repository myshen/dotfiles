#!/usr/bin/env python

import sys
import signal
from wsgiref.handlers import format_date_time
from time import mktime
from datetime import datetime
import getopt
from CGIHTTPServer import CGIHTTPRequestHandler
import SocketServer
import os


favicon = ("data:image/vndmicrosofticon;base64,"
    "AAABAAEAICACAAEAAQAwAQAAFgAAACgAAAAgAAAAQAAAAAEAAQAAAAAAAAAAAAAAAAAAAAAAA"
    "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
    "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
    "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
    "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
    "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=")


class CustomCGIHTTPRequestHandler(CGIHTTPRequestHandler):
    def __init__(self, *args, **kwargs):
        CGIHTTPRequestHandler.__init__(self, *args, **kwargs)
        self.cgi_directories.append('/cgi-bin')

    def do_GET(self, *args, **kwargs):
        if self.path == '/favicon.ico':
            protocol, data = favicon.split(',')
            scheme, info = protocol.split(':')
            mimetype, rest = info.split(';')
            
            self.send_response(200)
            self.send_header('Content-type', mimetype)
            httpdate = format_date_time(mktime(datetime.utcnow().timetuple()))
            self.send_header('Last-Modified', httpdate)
            self.end_headers()
            self.wfile.write(data.decode('base64'))
            return
        CGIHTTPRequestHandler.do_GET(self, *args, **kwargs)


def main(argv):
    opts, args = getopt.getopt(argv[1:], 'p:', 'port=')
    
    port = None
    for o, a in opts:
        if o in ('-p', '--port'):
            try:
        	    port = int(a)
            except ValueError:
                print >> sys.stderr, "port must be an integer in [0, 65535]"
                return 1
        else:
        	assert False, 'unhandled option'
    
    if not port:
        print >> sys.stderr, "Usage: server.py (-p|--port) <port>"
    	return 1

    if len(args) >= 1:
    	os.chdir(os.path.realpath(args[0]))

    Handler = CustomCGIHTTPRequestHandler
    httpd = SocketServer.TCPServer(("0.0.0.0", port), Handler)
    httpd.server_name = 'testserver'
    httpd.server_port = port

    def shutdown(*args):
        print "Stopping server on port %d..." % port
        def hardStop(*args):
            print "Waited 5 seconds. Hard stop."
            sys.exit(1)
        signal.signal(signal.SIGALRM, hardStop)
        signal.alarm(5)
        httpd.shutdown()
        print "Shutdown complete."

    #signal.signal(signal.SIGINT, shutdown)
    #signal.signal(signal.SIGTERM, shutdown)

    print "Serving %s at port %d" % (os.getcwd(), port)
    os.environ['DOCUMENT_ROOT'] = os.getcwd()
    try:
        httpd.serve_forever()
    except KeyboardInterrupt:
        shutdown()
    return 0


if __name__ == "__main__":
	sys.exit(main(sys.argv))
