#!/bin/bash

apt-get install build-essential libssl-dev libffi-dev python-dev nfs-kernel-server

pip install cffi --upgrade || exit 1
pip install cryptography --upgrade || exit 1
pip install paramiko --upgrade
