


##
#
#  IMPORTANT - Nothing here should be secret/sensitive.
#.    Use an alternate and private repo for that
#
##
source ~/.bash_secrets  # lives in seperate repo, restricted to only eddie.


HISTCONTROL=ignoredups:erasedups
setopt APPEND_HISTORY
setopt histignoredups
#precmd() {
#	history -n; history -w; history -c; history -r
#}

source /usr/local/etc/profile.d/z.sh

# aliases]
alias cal='date +%m\ %Y | xargs cal'
alias brewup='brew update; brew upgrade; brew prune; brew cleanup; brew doctor'
alias ls='ls -GFh'

# add any keys in .ssh
grep -slR "PRIVATE" ~/.ssh/ | xargs ssh-add

#jenv enbales mult java to be co-existent.
export JENV_ROOT=/usr/local/opt/jenv
if which jenv > /dev/null; then eval "$(jenv init -)"; fi
# set by jenv export JAVA_HOME="$(/usr/libexec/java_home)"

export PATH=~/scripts:~/bin:/usr/local/sbin:/usr/local/bin:$PATH
export PATH="/usr/local/opt/python/libexec/bin:/Users/eddie/Library/Python/3.6/bin:$PATH"

export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"

export GOPATH=/Users/eddie/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
