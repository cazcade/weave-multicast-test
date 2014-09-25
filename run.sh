#!/bin/bash -eu
while ! grep -q ^1$ /sys/class/net/ethwe/carrier 2>/dev/null
do sleep 1
done
java -cp /jgroups.jar org.jgroups.tests.McastReceiverTest -mcast_addr 231.12.21.132 -port 45566 &
java -cp /jgroups.jar org.jgroups.tests.McastSenderTest -mcast_addr 231.12.21.132 -port 45566
