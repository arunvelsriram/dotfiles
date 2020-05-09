#!/usr/bin/env bash

about-plugin 'my personal functions'

lwhich() {
  [ -z $1 ] && echo "Argument missing" && return 1
  ls -l $(which $1)
}

