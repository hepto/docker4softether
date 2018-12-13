#!/bin/bash

docker run -d \
    --name softether \
    --restart=always \
    --cap-add=NET_ADMIN \
    # bridge (L2TP example; additional port srequried for OpenVPN)
      -p 500:500/udp \
      -p 4500:4500/udp \
      # GUI config port
      -p 5555:5555/tcp \
    # host
      #--network host \
    # macvlan
      #--network macvlan \
      #--ip IP_ADDRESS \
    -v path/to/vpn_server.config:/usr/local/vpnserver/vpn_server.config \
    softether
