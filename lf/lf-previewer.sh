#!/usr/bin/bash

case "$1" in
  *.tar*)
    tar tf "$1";
  ;;
  *.zip)
    unzip -l "$1";
  ;;
  *.jpg)
    chafa "$1";
  ;;
  *.jpeg)
    chafa "$1";
  ;;
  *.png)
    chafa "$1";
  ;;
  *.gif)
    chafa "$1";
  ;;
  *.conf)
    bat -l nginx --paging=never --style=numbers --terminal-width $(($2 - 5)) -f "$1"; 
  ;;
  *)
    bat --paging=never --style=numbers --terminal-width $(($2 - 5)) -f "$1";
  ;;
esac
