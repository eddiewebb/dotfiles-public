#!/bin/bash

# all the proxies to set, include both CASES.
proxies=( http_proxy https_proxy HTTPS_PROXY HTTP_PROXY RSYNC_PROXY rsync_proxy ftp_proxy FTP_PROXY )

case "$1" in
 off)
    echo "Unsetting any proxy values."
    for pname in "${proxies[@]}";do
     unset $pname
    done
    echo "Disabling proxy in global git config"
     git config --global --unset http.proxy
     set | grep -i 'proxy='
    ;;
 on)
    echo "Setting proxy for http(s), ftp and rsync"
    for pname in "${proxies[@]}";do
     export $pname=http://www-proxy.lmig.com:80
    done
    echo "setting global git proxy"
    git config --global http.proxy http://www-proxy.lmig.com:80
    export no_proxy="*.local"
    set | grep -i 'proxy='
    ;;
 local)
    echo "Specifying local port as proxy"
    for pname in "${proxies[@]}";do
     export $pname=http://127.0.0.1:3128
    done
    echo "setting global git proxy"
    git config --global http.proxy http://127.0.0.1:3128
    set | grep -i 'proxy='
    ;;
 fix)
	echo "Updating hashed password for CNTLM.."
	echo -n "Enterprise ID (capital N, ie. N0158588): "
	read NNUM
    echo "Enter your enterprise password when you see key icon.."
    cntlm -T /tmp/cntlmpass -H -u $NNUM@lm
    rez=`grep 'PassNTLMv2' /tmp/cntlmpass`
    if [ -n "$rez" ];then
        echo "adding $rez to cntlm config"
        sed -Ei '' "s/PassNTLMv2.*/$rez/" /usr/local/etc/cntlm.conf
        echo "restarting cntlm (enter your local admin password if prompted)"
        sudo killall cntlm
        /usr/local/bin/cntlm
        echo "done, local proxy should use new password"
    else
        echo "cntlm failure"
        cat /tmp/cntlmpass
    fi
    ;;
*)
    echo "Usage: \`source $0 on|off\`"
    ;;
esac
