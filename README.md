weave-multicast-test
====================

On the first host:

    docker attach $(weave run 10.0.2.106/8 -t -i cazcade/weave-multicast-test)
  
On the second host:

    docker attach $(weave run 10.0.2.105/8 -t -i cazcade/weave-multicast-test)
  
Anything typed into one host should appear on the other.


