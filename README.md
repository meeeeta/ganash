[![Anchore Container Scan](https://github.com/meeeeta/ganash/actions/workflows/anchore.yml/badge.svg?branch=main)](https://github.com/meeeeta/ganash/actions/workflows/anchore.yml)

```shell
docker run --name firefox -it -v /tmp/.X11-unix:/tmp/.X11-unix -v /var/run/dbus:/var/run/dbus  -e DISPLAY=unix$DISPLAY  --device /dev/snd:/dev/snd  browser

docker start firefox
```
