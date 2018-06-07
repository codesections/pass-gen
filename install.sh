#!/bin/bash

install -m 0644 -v ./man/pass-gen.1 /usr/share/man/man1/pass-gen.1
install -m 0755 -v ./pass-gen /usr/bin/pass-gen
install -d /usr/lib/pass-gen
cp -r ./character-lists /usr/lib/pass-gen
cp -r ./wordlists /usr/lib/pass-gen
