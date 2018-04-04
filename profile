# terminal prompt
export PS1="| \[\e[0;31m\]\u\[\e[0m\]@\[\e[0;34m\]\w\[\e[0m\]\[\033[32m\]\$(parse_git_branch)\[\033[00m\] \n| => "
export PS2="| => "

# colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

export EDITOR=/usr/bin/vim
export BLOCKSIZE=1k

# Go
export GOPATH=$HOME/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

# Binaries
export PATH=$PATH:$HOME/bin

# NVM - node version manager
export NVM_DIR="/Users/davros/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm


# Open current folder in finder
alias f='open -a Finder ./'

alias qfind="find . -name "                 # qfind:    Quickly search for file
ff () { /usr/bin/find . -name "$@" ; }      # ff:       Find file under the current directory
ffs () { /usr/bin/find . -name "$@"'*' ; }  # ffs:      Find file whose name starts with a given string
ffe () { /usr/bin/find . -name '*'"$@" ; }  # ffe:      Find file whose name ends with a given string


# Make move and copy verbose and rewrite aware
#alias cp='cp -iv'
alias mv='mv -iv'

# Make mkdir verbose and create whole path
alias mkdir='mkdir -pv'
alias less='less -FSRXc'
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels
alias ~="cd ~"

# Prepare via ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" ~/bin/sublime
alias edit='sublime'
alias sedit='sudo sublime'
alias c='clear'

alias which='terminalype -all'
alias path='echo -e ${PATH//:/\\n}'

# Fix messed up terminal
alias fix_stty='stty sane'

# Listings
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'
alias ls='ls -l'
alias ll='ls -FGlAhp'
cd() { builtin cd "$@"; ll; }

# Network
alias myip='curl ip.appspot.com'                    # myip:         Public facing IP Address
alias netCons='lsof -i'                             # netCons:      Show all open TCP/IP sockets
alias flushDNS='dscacheutil -flushcache'            # flushDNS:     Flush out the DNS Cache
alias lsock='sudo /usr/sbin/lsof -i -P'             # lsock:        Display open sockets
alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP'   # lsockU:       Display only open UDP sockets
alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP'   # lsockT:       Display only open TCP sockets
alias ipInfo0='ipconfig getpacket en0'              # ipInfo0:      Get info on connections for en0
alias ipInfo1='ipconfig getpacket en1'              # ipInfo1:      Get info on connections for en1
alias openPorts='sudo lsof -i | grep LISTEN'        # openPorts:    All listening connections

# Cleanup recursively all .DS_Store files
alias cleanupDS="find . -type f -name '*.DS_Store' -ls -delete"

#docker
alias dpsa='docker ps -a'
alias dexit='docker exec -it'
alias dkill='docker kill'
alias drm='docker rm'
alias drmi='docker rmi'
alias dmi='docker images'
alias di='docker inspect'

#kubernetes
alias k='kubectl'

#vagrant
alias vssh='vagrant ssh'
alias vup='vagrant up'
alias vhalt='vagrant halt'
alias vprovision='vagrant provision'

#folders
alias _github='cd ~/git/github.com'
alias _s2='cd ~/git/git.sinnerschrader.com'
alias _s2s='cd ~/git/gitlab.sinnerschraderswipe.com'
alias _s2c='cd ~/git/git.sinnerschrader.com/contentplatform'
alias _g='cd ~/go/src'
alias _go='_g'
alias _d='cd ~/Drive/'
alias _drive='_d'

# Git branch in prompt.
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
test -f ~/.git-completion.bash && . $_

# Mkdir and cd into it
mcd () { mkdir -p "$1" && cd "$1"; }

# Trash file - dont remove completely
trash () { command mv "$@" ~/.Trash ; }

# Use quicklook at file
ql () { qlmanage -p "$*" >& /dev/null; }


# Show useful information about this computer
ii() {
    echo -e "\nYou are logged on ${RED}$HOST"
    echo -e "\nAdditionnal information:$NC " ; uname -a
    echo -e "\n${RED}Users logged on:$NC " ; w -h
    echo -e "\n${RED}Current date :$NC " ; date
    echo -e "\n${RED}Machine stats :$NC " ; uptime
    echo -e "\n${RED}Current network location :$NC " ; scselect
    echo -e "\n${RED}Public facing IP Address :$NC " ;myip
    #echo -e "\n${RED}DNS Configuration:$NC " ; scutil --dns
    echo
}


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/davros/gcloud/path.bash.inc' ]; then source '/Users/davros/gcloud/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/davros/gcloud/completion.bash.inc' ]; then source '/Users/davros/gcloud/completion.bash.inc'; fi
