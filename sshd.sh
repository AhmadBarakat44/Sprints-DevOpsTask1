#!/bin/bash
read port
  if [[ $port ]] && [ $port -eq $port ]
  then
     if [[ $port -ge 1024 && $port -le 65535 ]]; then
	echo "Port ${port}" >> /etc/ssh/sshd_config
     else
        echo "$port is not in valid port range"
	exit 0
     fi
  else
     echo "$port is not an integer or not defined"
     exit 0
  fi
sed -i '/^PermitRootLogin[ \t]\+\w\+$/{ s//PermitRootLogin no/g; }' /etc/ssh/sshd_config

readarray -t users <<< "$(cut -d: -f1 /etc/passwd)"

for i in "${users[@]}"
do : 
    if [ "$(sudo -l -U $i)" != "User $i is not allowed to run sudo on localhost." ]; then
       echo "sudo user found"
       break
    fi
done
