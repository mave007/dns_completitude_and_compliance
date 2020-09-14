#!/bin/bash

testdir="tests"
dnscomp="./dns-comp.py"

for i in ${testdir}/*.cmd ; do
	echo "## Running ${i/.cmd/}... $(grep '#' ${i} | cut -d '#' -f2)" 
	${dnscomp} ${i/cmd/yaml} ${i}
done
