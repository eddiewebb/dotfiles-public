


##
#
#  IMPORTANT - Nothing here should be secret/sensitive.
#.    Use an alternate and private repo for that
#
##
source ~/.bash_secrets  # lives in seperate repo, restricted to only eddie.



source .bash_prompt


# aliases]
alias composer='composer.phar'
alias atl-cln-run='unset https_proxy && atlas-clean -P atlassian-sdk && atlas-run -P atlassian-sdk'
alias atl-run='unset https_proxy && atlas-run -P atlassian-sdk'
alias cal='date +%m\ %Y | xargs cal'
alias lamp='mysql.server start && sudo httpd -k start'
alias brewup='brew update; brew upgrade; brew prune; brew cleanup; brew doctor'
alias ls='ls -GFh'

# add any keys in .ssh
grep -slR "PRIVATE" ~/.ssh/ | xargs ssh-add

#jenv enbales mult java to be co-existent.
export JENV_ROOT=/usr/local/opt/jenv
if which jenv > /dev/null; then eval "$(jenv init -)"; fi

export PATH=~/scripts:~/bin:/usr/local/sbin:/usr/local/bin:$PATH
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
# set by jenv export JAVA_HOME="$(/usr/libexec/java_home)"
