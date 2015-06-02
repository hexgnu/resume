#!/bin/sh
while inotifywait -e ATTRIB ./main.tex; do
  make
done

