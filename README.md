```shell
docker run --name firefox -it -v /tmp/.X11-unix:/tmp/.X11-unix -v /var/run/dbus:/var/run/dbus  -e DISPLAY=unix$DISPLAY  --device /dev/snd:/dev/snd  browser

docker start firefox
```
