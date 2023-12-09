#!/usr/bin/bash

case "$1" in
  *.mp3|*.avi|*.wmv|*.mp4|*.mkv)
    exiftool "$1";
  ;;
  *.tar*)
    tar tf "$1";
  ;;
  *.zip)
    unzip -l "$1";
  ;;
  *.jpg|*.jpeg|*.png|*.gif)
    chafa "$1";
  ;;
  *.conf)
    bat -l nginx --paging=never --style=numbers --terminal-width $(($2 - 5)) -f "$1"; 
  ;;
  *)
    bat --paging=never --style=numbers --terminal-width $(($2 - 5)) -f "$1";
  ;;
esac
