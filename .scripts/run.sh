#!/usr/bin/env bash

docker \
  compose \
  up \
  --build \
  --force-recreate \
  --remove-orphans
