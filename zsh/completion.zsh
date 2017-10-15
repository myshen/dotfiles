dir_comp="/usr/local/share/zsh/site-functions"
fpath=($ZDOTDIR/completion $dir_comp $fpath) 

# complete commandline switches
setopt completealiases

# Nice zsh completion from github.com/windelicato
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors 'reply=( "=(#b)(*$VAR)(?)*=00=$color[green]=$color[bg-green]" )'
zstyle ':completion:*:*:*:*:hosts' list-colors '=*=30;41'
zstyle ':completion:*:*:*:*:users' list-colors '=*=$color[green]=$color[red]'
zstyle ':completion:*' menu select

# while read -r fname; do
# 	source_file_if_exists "$fname"
# done < <(find "$dir_comp" -depth 1 -not -name '*.bash')

source_file_if_exists "$DOTFILES/zsh/git-completion.zsh"
source_file_if_exists "/usr/local/share/autojump/autojump.zsh"
source_file_if_exists "/usr/local/Cellar/fzf/0.16.8_1/shell/completion.zsh"
source <(awless completion zsh)
# vim: ft=sh
