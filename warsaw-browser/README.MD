
# Running

```
 docker run -it --rm \
            -v /tmp/.X11-unix:/tmp/.X11-unix \
            -v $HOME/Downloads:/home/bank/Downloads \
            -e DISPLAY=unix$DISPLAY \
            --name warsaw-browser \
            lichti/warsaw-browser
```

# Tip
Maybe you need to execute this before:
```
xhost +
```