#!/bin/bash

echo "running ${IMAGE:=tnr}"
COMMAND=$@

docker run -it  \
                -p 5001:5000 \
                -v $PWD/etc-passwd:/etc/passwd \
                -v $PWD/integral-home:/home/integral \
                -e GCPROXY_SECRET_LOCATION=/secret \
                -e POLAR_GRB_DATA_CSV=/data/polar/polar_grbs.csv \
                -v $PWD/secret:/secret \
	        --user $(id -u) \
	        $IMAGE \
                bash -c "

export HOME=/home/integral
#. /init.sh

cd \$HOME

echo -e '\\e[31mrunning\\e[37m $COMMAND\\e[0m'

set -xe

$COMMAND
"


