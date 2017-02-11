#!/bin/bash

set -e

echo ">> Downloading bundled Node"
if [ `uname -s || echo x` = "FreeBSD" ]; then
    ln -sf /usr/local/bin/node ./bin/node
else
    node script/download-node.js
fi

echo
echo ">> Rebuilding apm dependencies with bundled Node $(./bin/node -p "process.version + ' ' + process.arch")"
./bin/npm rebuild

echo
echo ">> Deduping apm dependencies"
./bin/npm dedupe
