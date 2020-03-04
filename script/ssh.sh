#!/bin/bash
# sh ssh.sh username@hostname
if [ "$1" = "" ];then
    echo "ssh.sh: username or hostname not known"
else
    if [ ! -f ~/.ssh/id_rsa.pub ];then
        ssh-keygen -t rsa -N '' -f id_rsa -q 
    fi
    ssh -o PreferredAuthentications=publickey $1 -q /bin/true
    if [ $? = 255 ];then
        home=$(wslpath $(cmd.exe /C "echo %USERPROFILE%" | tr -d '\r'))
        ssh $1 "echo \"`cat ~/.ssh/id_rsa.pub $home/.ssh/id_rsa.pub | tr -s "\r\n" "\n" `\" >> .ssh/authorized_keys"
    fi
fi
