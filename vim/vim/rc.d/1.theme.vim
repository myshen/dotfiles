" color scheme
if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
  set t_Co=256
endif
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256  " Access colors present in 256 colorspace
  source ~/.vimrc_background
else
  colorscheme base16-tomorrow
endif

" Terminal colors http://blog.infinitered.com/entries/show/6
set background=dark " Do this after colorscheme. It doesn't work before.
