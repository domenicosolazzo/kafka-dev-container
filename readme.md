# running

* run a sclasen/zk-dev-container per https://github.com/sclasen/zk-dev-container

```
# use the ip assigned to zk above
ZK_IP=192.168.1.1

KAFKA=$(sudo docker run -d -p 9998 -e HOSTNAME=localhost -e ZK_CONN=$ZK_IP:2181)

# the container runs pipework --wait so it can get its interface configured so it can reach zk

pipework br1 $KAFKA 192.168.1.2/24

# check to see if up
sudo docker logs $KAFKA


```
