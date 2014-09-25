#!/bin/bash
network="10.$[ 10 + $[ RANDOM % 250 ]].$[ 10 + $[ RANDOM % 250 ]].2/8"
echo $network
C=$(weave run $network -t -i cazcade/weave-multicast-test $1)
echo $C
NSPID=$(docker inspect --format='{{ .State.Pid }}' $C)
ln -s /proc/$NSPID/ns/net /var/run/netns/$NSPID
ip netns exec $NSPID route add -net 224.0.0.0 netmask 240.0.0.0 dev ethwe
docker attach $C
