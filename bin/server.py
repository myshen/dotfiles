#!/usr/bin/env python

import sys
import signal
import getopt
import CGIHTTPServer as S
import SocketServer
import os


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

    Handler = S.CGIHTTPRequestHandler
    Handler.cgi_directories.append('/ci/cgi-bin')
    httpd = SocketServer.TCPServer(("", port), Handler)
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
