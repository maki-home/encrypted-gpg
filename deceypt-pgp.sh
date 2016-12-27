#!/bin/bash

if [ "$ENCRYPTION_PASSWORD" == "" ];then
   echo "ENCRYPTION_PASSWORD must be set"
   exit 1
fi

GPG_DIR=$1
if [ "$GPG_DIR" == "" ];then
   GPG_DIR=./
fi

abs_dirname() {
    local cwd="$(pwd)"
    local path="$1"
    
    while [ -n "$path" ]; do
	cd "${path%/*}"
	local name="${path##*/}"
	path="$(readlink "$name" || true)"
    done

    pwd -P
    cd "$cwd"
}

SCRIPT_DIR="$(abs_dirname "$0")"
GPG_DIR="$(abs_dirname "$GPG_DIR/")"

echo "Decrypt to $GPG_DIR"
openssl aes-256-cbc -pass pass:$ENCRYPTION_PASSWORD -in $SCRIPT_DIR/pubring.gpg.enc -out $GPG_DIR/pubring.gpg -d
openssl aes-256-cbc -pass pass:$ENCRYPTION_PASSWORD -in $SCRIPT_DIR/secring.gpg.enc -out $GPG_DIR/secring.gpg -d
