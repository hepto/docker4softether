FROM alpine as builder

WORKDIR /softether

RUN apk add --update git make gcc libc-dev ncurses-dev readline-dev openssl-dev

RUN git clone --branch v4.28-9669-beta --depth 1 https://github.com/SoftEtherVPN/SoftEtherVPN_Stable.git .

RUN ./configure

RUN make

FROM alpine

RUN apk add --update --no-cache libssl1.0 libcrypto1.0 readline ncurses-libs iptables

COPY --from=builder /softether/bin/vpnserver/vpnserver /softether/bin/vpncmd/vpncmd /softether/bin/vpnserver/hamcore.se2 /usr/local/vpnserver/

EXPOSE 5555/tcp 500/udp 4500/udp

ENTRYPOINT ["/usr/local/vpnserver/vpnserver", "execsvc"]
