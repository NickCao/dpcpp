#!/usr/bin/env bash
sudo docker run --rm -ti \
  -v $HOME/dtk-21.10:/public/software/compiler/rocm/dtk-21.10 \
  -v $HOME:/public/home/thu_pacman/nickcao \
  -w /public/home/thu_pacman/nickcao \
  dpcpp
