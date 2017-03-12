#ruby
eval "$(rbenv init -)"
source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh

#pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

#alias
alias pgstart="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias pgstop="pg_ctl -D /usr/local/var/postgres stop"
alias subl='open -a Sublime\ Text\ 2 --args'
alias refresh='source ~/.bashrc'
alias ruby_init='eval "$(rbenv init -)"'
alias be='bundle exec'
alias bi='bundle install'
alias bl='bundle list'
alias bu='bundle update'
alias bp='bundle package'
alias sl=ls
alias ls='ls -G'        # Compact view, show colors
alias la='ls -AF'       # Compact view, show hidden
alias ll='ls -al'
alias l='ls -a'
alias l1='ls -1'
alias ..='cd ..'         # Go up one directory
alias ...='cd ../..'     # Go up two directories
alias ....='cd ../../..' # Go up three directories
alias -- -='cd -'        # Go back


#export
export PS1="________________________________________________________________________________\n| \w @ \h (\u) \n| => "
export PS2="| => "


#settings
bind Space:magic-space
bind "set completion-ignore-case on"
bind "set completion-map-case on"
bind "set show-all-if-ambiguous on"
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\e[C": forward-char'
bind '"\e[D": backward-char'
PROMPT_DIRTRIM=2
PROMPT_COMMAND='history -a'
HISTSIZE=500000
HISTFILESIZE=100000
HISTCONTROL="erasedups:ignoreboth"
HISTTIMEFORMAT='%F %T '
set -o noclobber

#options
shopt -s globstar 2> /dev/null
shopt -s histappend
shopt -s checkwinsize
shopt -s cmdhist
shopt -s autocd 2> /dev/null
shopt -s dirspell 2> /dev/null
shopt -s cdspell 2> /dev/null
shopt -s cdable_vars

#functions
git-tag () 
{
    PREV_TAG=`git describe | cut -d '-' -f 1`;
    TAG_PREFIX=`echo $PREV_TAG | sed -e 's/[0-9][0-9]*$//'`;
    CURR_TAG=`echo $PREV_TAG | sed -e 's/^[^0-9]*//'`;
    if [ -z $CURR_TAG ]; then
        echo "Can not parse tag!";
        return 1;
    fi;
    NEW_TAG=$(( $CURR_TAG + 1 ));
    NEW_TAG="${TAG_PREFIX}${NEW_TAG}";
    echo "Bumping tag from ${PREV_TAG} -> ${NEW_TAG}";
    MSG="$1";
    if [ -z "$MSG" ]; then
        MSG=$NEW_TAG;
    fi;
    git tag -a $NEW_TAG -m "${MSG}";
    git push origin ${NEW_TAG}
}




export NVM_DIR="/Users/michaelbeale/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

source ~/.bash-powerline.sh
source ~/.bash-private.sh
