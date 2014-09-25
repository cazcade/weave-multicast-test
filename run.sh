#!/bin/bash -eu
curl http://www.nmsl.cs.ucsb.edu/MulticastSocketsBook/c_send_receive.tar.gz | tar xzvf -
gcc -o mcsend c/mcsend.c ; gcc -o mcreceive c/mcreceive.c
while ! grep -q ^1$ /sys/class/net/ethwe/carrier 2>/dev/null
do sleep 1
done
ip=$(ip addr show ethwe | grep inet | grep -v inet6 | sed 's/^[ ]*inet //g'| cut -d/ -f 1)
if [[ $1 == "receive" ]] 
then
  java -Djava.net.preferIPv4Stack=true -cp /jgroups.jar org.jgroups.tests.McastReceiverTest -bind_addr ${ip} -mcast_addr 231.12.21.132 -port 45566 
elsif [[ $1 == "send" ]] 
  java -Djava.net.preferIPv4Stack=true -cp /jgroups.jar org.jgroups.tests.McastSenderTest -bind_addr ${ip} -mcast_addr 231.12.21.132 -port 45566
elsif [[ $1 == "rcv" ]] 
./mcsend 239.1.2.3 1234
elsif [[ $1 == "snd" ]] 
./mcreceive 239.1.2.3 1234
fi


