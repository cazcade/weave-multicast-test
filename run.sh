#!/bin/bash -eu
while ! grep -q ^1$ /sys/class/net/ethwe/carrier 2>/dev/null
do sleep 1
done
ip=$(ip addr show ethwe | grep " inet" | grep -v inet6 | sed 's/^[ ]*inet //g'| cut -d/ -f 1)
if [[ $1 == "receive" ]] 
then
  java -Djava.net.preferIPv4Stack=true -cp /jgroups.jar org.jgroups.tests.McastReceiverTest -bind_addr ${ip} -mcast_addr 231.12.21.132 -port 45566 
else
  java -Djava.net.preferIPv4Stack=true -cp /jgroups.jar org.jgroups.tests.McastSenderTest -bind_addr ${ip} -mcast_addr 231.12.21.132 -port 45566
fi
