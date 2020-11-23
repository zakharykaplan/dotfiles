#
#  aliases.zsh
#  Zsh aliases.
#
#  Created by Zakhary Kaplan on 2019-06-04.
#  Copyright © 2019 Zakhary Kaplan. All rights reserved.
#

# --------------------------------
#             Aliases
# --------------------------------

# -- Developer --
alias make='make -j$(nproc)'
alias py='python'
alias py3='python3'

# -- Environment --
alias path='echo ${PATH//:/\\n}'
alias reload='clear && exec $SHELL -l'

# -- Filesystem --
alias cp='cp -R'
alias l1='ls -1'
alias lh='ls -A'
alias rm='rm -d'
alias scp='scp -r'
alias tree='tree -C -I "$TREE_IGNORE"'
for i in {1..9}; do
    alias tree$i="tree -L $i"
done

# -- Utilities --
# docker
alias dcha='cat ~/.oh-my-zsh/plugins/docker-compose/docker-compose.plugin.zsh | grep'
alias dkha='cat ~/.oh-my-zsh/custom/plugins/zsh-docker-aliases/alias.zsh | grep'
# git
alias gci='git checkout-index'
alias gci!='git checkout-index --all --force'
alias gdiff='git diff --no-index'
alias gha='cat ~/.oh-my-zsh/plugins/git/git.plugin.zsh | grep'
# tmux
alias t='tmux'
alias tksv='tmux kill-server'
alias tls='tmux list-sessions'
alias tv="tmux new-session 'vim'"
# vim
alias v='vim'
alias vd='vimdiff'

# vim:ft=sh: