#!/usr/bin/bash

set -e
set -x

WORKSPACE_DIRS=$(dirname `pwd`)

function trigger_ci() {
  pushd $WORKSPACE_DIRS > /dev/null
     make ci
  popd
}

trigger_ci