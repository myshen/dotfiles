"""Python startup file.

"""

def enable_repl_readline():
    import readline
    import rlcompleter
    import atexit
    import os

    # tab completion
    readline.parse_and_bind('tab: complete')

    # history file
    histfile = os.path.join(os.environ['HOME'], '.pythonhistory')
    try:
        readline.read_history_file(histfile)
    except IOError:
        pass
    atexit.register(readline.write_history_file, histfile)
enable_repl_readline()


#def add_global_site():
#    import site
## ~/.local/lib/python2.7/site-packages/homebrew.pth
#
#    #site.addsitedir('/Users/mattshen/.pyenv/versions/global/lib/python2.7/site-packages')
#    #site.addsitedir('/usr/local/lib/python2.7/site-packages')
#add_global_site()
