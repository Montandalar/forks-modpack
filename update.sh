#!/bin/sh
#Borrowed from pandorabox-io

# update meta repo
git pull
# sync repo urls
git submodule sync
# initialize new repos
git submodule init
# update commits
git submodule update
