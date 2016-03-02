#terminal prompt
export PS1="| \[\e[0;31m\]\u\[\e[0m\]@\[\e[0;34m\]\w\[\e[0m\]\[\033[32m\]\$(parse_git_branch)\[\033[00m\] \n| => "
export PS2='\[\e[0;31m\]\u\[\e[0m\]@\[\e[0;34m\]\w\[\e[0m\]\$ '
#enable colors
export CLICOLOR=1
#specify colors
export LSCOLORS=GxFxCxDxBxegedabagaced

export EDITOR=/usr/bin/vim
export BLOCKSIZE=1k

export GOPATH=$HOME/golang
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

export NVM_DIR="/Users/rosa/.nvm"
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

alias edit='atom'
alias c='clear'

alias which='type -all'
alias path='echo -e ${PATH//:/\\n}'

# Fix messed up terminal
alias fix_stty='stty sane'

# Write piped output to desktop file out.txt
alias DT='tee ~/Desktop/out.txt'

# Listings
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'
alias ls='ls -l'
alias ll='ls -FGlAhp'
cd() { builtin cd "$@"; ll; }
alias ttop="top -R -F -s 10 -o rsize"

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

#vagrant
alias vssh='vagrant ssh'
alias vup='vagrant up'
alias vhalt='vagrant halt'
alias vprovision='vagrant provision'

#folders
alias _s='cd /Users/rosa/Dropbox/FIT/'
alias _p='cd /Users/rosa/Projects/'
alias _projects='cd /Users/rosa/Projects/'

#git

# Git branch in prompt.
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
test -f ~/.git-completion.bash && . $_

#ssh hosts
alias ssh_umblog='ssh -A -t -l davros chiara ssh -A -t -l szzdev ume-op ssh -A -t -l szzdev ume-blog-shortterm01.int'

# Search man page: mans <command> <key>
mans () {
    man $1 | grep -iC2 --color=always $2 | less
}

# List processes owned by me
my_ps() { ps $@ -u $USER -o pid,%cpu,%mem,start,time,bsdtime,command ; }

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
