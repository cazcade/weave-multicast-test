weave-multicast-test
====================

Assuming a weave network of 10.0.0.0/8

On the first host:

    docker attach $(weave run 10.0.2.106/8 -t -i cazcade/weave-multicast-test receive)
  
On the second host:

    docker attach $(weave run 10.0.2.105/8 -t -i cazcade/weave-multicast-test send)
  
Anything typed into the second host should appear on the first.

To try the latest fix download weave-test.sh and use on Host 1

    ./weave-test.sh receive

and on Host 2

    ./weave-test.sh send



