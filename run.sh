#!/usr/bin/env bash

jtl_file=$1
output_file=$2

docker rm -f restcache-jmeter
docker run -it -d --name restcache-jmeter -v $(pwd):/root restcache-jmeter:latest bin/jmeter  -n -t /root/$jtl_file -l /root/$output_file