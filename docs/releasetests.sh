#!/bin/sh
# vim:tw=0:ts=4:sw=4

# this is a test script to run everything through its paces before you do a
# release. The basic idea is:

# 1) make distcheck to ensure that all autoconf stuff is setup properly
# 2) rebuild mock srpm using this version of mock under all distributed configs

# This test will only run on a machine with full access to internet.
# might work with http_proxy= env var, but I havent tested that.

set -e
set -x

DIR=$(cd $(dirname $0); pwd)
TOP_SRCTREE=$DIR/../
cd $TOP_SRCTREE

make distcheck ||:
./configure
make srpm
make src/daemontest

sudo rm -rf $TOP_SRCTREE/mock-unit-test
for i in $(ls etc/mock | grep .cfg | grep -v default | grep -v ppc); do
    time sudo ./py/mock.py --resultdir=$TOP_SRCTREE/mock-unit-test --uniqueext=unittest rebuild mock-*.src.rpm  -r $(basename $i .cfg)
done

(pgrep daemontest && echo "Exiting because there is already a daemontest running." && exit 1) || :
testConfig=fedora-8-x86_64
sudo ./py/mock.py -r $testConfig --resultdir=$TOP_SRCTREE/mock-unit-test init
cp src/daemontest /var/lib/mock/$testConfig/root/tmp/
sudo ./py/mock.py -r $testConfig --resultdir=$TOP_SRCTREE/mock-unit-test --no-clean -- chroot /tmp/daemontest
(pgrep daemontest && echo "Daemontest FAILED. found a daemontest process running after exit." && exit 1) || :
