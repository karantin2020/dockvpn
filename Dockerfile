FROM 	ubuntu:xenial
RUN 	echo "deb http://archive.ubuntu.com/ubuntu/ precise main universe" > /etc/apt/sources.list.d/precise.list; \
		wget -O - https://swupdate.openvpn.net/repos/repo-public.gpg|apt-key add -; \
		echo "deb http://build.openvpn.net/debian/openvpn/stable xenial main" > /etc/apt/sources.list.d/openvpn-aptrepo.list; \
		apt-get update -q; \
		apt-get install -qy openvpn iptables socat curl
ADD 	./bin /usr/local/sbin
VOLUME 	/etc/openvpn
EXPOSE 	443/tcp 1194/udp 8080/tcp
CMD 	run
