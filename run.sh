#!/bin/bash -eu
while ! ifconfig ethwe
do
    sleep 10
    ifconfig
done
java -cp /jgroups.jar org.jgroups.tests.McastReceiverTest -mcast_addr 231.12.21.132 -port 45566 &
java -cp /jgroups.jar org.jgroups.tests.McastSenderTest -mcast_addr 231.12.21.132 -port 45566
