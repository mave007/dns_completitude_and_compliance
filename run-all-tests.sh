#!/bin/bash

testdir="tests"
dnscomp="./dns-comp.py"

for i in ${testdir}/*.cmd ; do
	echo "## Running ${i/.cmd/}..."
	${dnscomp} ${i/cmd/yaml} ${i}
done
