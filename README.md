# softether4docker

Builds a softether VPN server.

To use:

Create an empty vpn_server.config file somewhere.  This will store your specific configuration.

Note: if you place the vpn_server.config in the root directoty of the repo it will be ignored by Git to avoid accidently pushing security credentials somewhere!

Then launch the image, mapping in the config as appropriate and choosing an appropriate networking method.

To configure, either use the Softether admin GUI and point it at the image on port 5555, or docker exec into the image and use the command line.


```
docker run -d \
    --name softether \
    --restart=always \
    --cap-add=NET_ADMIN \
    # bridge (L2TP example; additional ports requried for OpenVPN)
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
```

