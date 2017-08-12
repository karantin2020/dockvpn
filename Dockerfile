FROM 	ubuntu:xenial
RUN 	apt-get update -q; \
    	apt-get install -qy wget; \
    	echo "deb http://archive.ubuntu.com/ubuntu/ xenial main universe" > /etc/apt/sources.list.d/xenial.list; \
    	wget -O /tmp/openvpn.key https://swupdate.openvpn.net/repos/repo-public.gpg && apt-key add /tmp/openvpn.key; \
    	echo "deb http://build.openvpn.net/debian/openvpn/stable xenial main" > /etc/apt/sources.list.d/openvpn-aptrepo.list; \
    	apt-get update -q; \
    	apt-get install -qy openvpn iptables socat curl
ADD 	./bin /usr/local/sbin
VOLUME 	/etc/openvpn
EXPOSE 	443/tcp 1194/udp 8080/tcp
CMD 	run
