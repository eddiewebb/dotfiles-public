


##
#
#  IMPORTANT - Nothing here should be secret/sensitive.  
#.    Use an alternate and private repo for that
# 
##

# like this..
source ~/.bash_secrets  # lives in seperate repo, restricted to only eddie.

# any other files to delegate config to..
source .bash_prompt


# aliases
alias proxy='source ~/scripts/proxy.sh'
alias composer='composer.phar'
alias atl-cln-run='unset https_proxy && atlas-clean -P atlassian-sdk && atlas-run -P atlassian-sdk'
alias atl-run='unset https_proxy && atlas-run -P atlassian-sdk'
alias cal='date +%m\ %Y | xargs cal'
alias lamp='mysql.server start && sudo httpd -k start'
alias brewup='brew update; brew upgrade; brew prune; brew cleanup; brew doctor'
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
alias ls='ls -GFh'


#turn on lm proxy by default
proxy on

export PATH=~/scripts:~/bin:/usr/local/sbin:/usr/local/bin:$PATH
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
export JAVA_HOME="$(/usr/libexec/java_home)"



