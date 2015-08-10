#!/usr/bin/env bash
docker rm -f restcache-jmeter
docker run -it -d --name restcache-jmeter -v $(pwd):/root restcache-jmeter:latest bin/jmeter  -n -t /root/restcache-all.jmx -l $1