XAUTH=/tmp/.docker.xauth
if [ -f $XAUTH ]
    then
        rm $XAUTH
fi
xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -
chmod a+r $XAUTH
