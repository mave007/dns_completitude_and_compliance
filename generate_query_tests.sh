#!/bin/bash

# Create tests based the ones already made on:
# RSSAC047 (section 5.3) - https://www.icann.org/en/system/files/files/rssac-047-12mar20-en.pdf
# ISC DNS Compliance-Testing - https://gitlab.isc.org/isc-projects/DNS-Compliance-Testing

dig=$(which dig)
opts="+dnssec +norec +time=2 +tries=1 +noignore +yaml"
srv_test="localhost"
srv_expected="l.root-servers.net"
domain="."
outputdir="tests"


TESTDESC+=("# SOA record answer")
TESTS+=("${dig} ${domain} SOA @${srv_test} ${opts}") 

TESTDESC+=("# DNSKEY record answer")
TESTS+=("${dig} ${domain} DNSKEY @${srv_test} ${opts}") 

TESTDESC+=("# NS record answer")
TESTS+=("${dig} ${domain} NS @${srv_test} ${opts}") 

TESTDESC+=("# NXDOMAIN answer")
TESTS+=("${dig} www.rssac047-test.zyxwvutsrqp A @${srv_test} ${opts}") 

TESTDESC+=("# Known DS record")
TESTS+=("${dig} us DS @${srv_test} ${opts} ")

TESTDESC+=("# Known NS record")
TESTS+=("${dig} us NS @${srv_test} ${opts} ")

TESTDESC+=("# Known NS record")
TESTS+=("${dig} cm NS @${srv_test} ${opts} ")

TESTDESC+=("# Known NS record")
TESTS+=("${dig} cl NS @${srv_test} ${opts} ") 

TESTDESC+=("# Known NS record")
TESTS+=("${dig} by NS @${srv_test} ${opts} ")

TESTDESC+=("# No EDNS and no DNSSEC")
TESTS+=("${dig} +noedns +noad SOA ${domain} @${srv_test} ${opts} ") # dns

TESTDESC+=("# No EDNS, no DNSSEC, Authoritative bit")
TESTS+=("${dig} +noedns +noad +aaflag SOA ${domain} @${srv_test} ${opts} ") # aa

TESTDESC+=("# No EDNS, DNSSEC, Checking disable bit")
TESTS+=("${dig} +noedns +ad +cd SOA ${domain} @${srv_test} ${opts} ") # ad

TESTDESC+=("# No EDNS, No DNSSEC, Checking disable bit")
TESTS+=("${dig} +noedns +noad +cd SOA ${domain} @${srv_test} ${opts} ") # cd

TESTDESC+=("# Recursion available flags")
TESTS+=("${dig} +noedns +noad +cd +raflag SOA ${domain} @${srv_test} ${opts} ") # ra

TESTDESC+=("# Recursion disable flag")
TESTS+=("${dig} +noedns +noad SOA ${domain} @${srv_test} ${opts/+norec/+rec} ") # rd

TESTDESC+=("# Truncation bit")
TESTS+=("${dig} +noedns +noad +tcflag SOA ${domain} @${srv_test} ${opts} ") # tc

TESTDESC+=("# zflag (last unassigned DNS header flag)")
TESTS+=("${dig} +noedns +noad +zflag SOA ${domain} @${srv_test} ${opts} ") # zflag

TESTDESC+=("# Unknown/unassigned opcode (code 15)")
TESTS+=("${dig} +noedns +noad +header-only +opcode=15 @${srv_test} ${opts} ") # opcode

TESTDESC+=("# Unknown/unassigned opcode with flags")
TESTS+=("${dig} +noedns +header-only +opcode=15 +tcflag +raflag +cd +ad +aaflag +zflag ${opts/+norec/+rec} @${srv_test}") # opcodeflg

TESTDESC+=("# Unknown RR type")
TESTS+=("${dig} +noedns +noad TYPE666 @${srv_test} SOA ${domain} ${opts}") # type666

TESTDESC+=("# TCP query only")
TESTS+=("${dig} +noedns +noad +tcp @${srv_test} SOA ${domain} ${opts}") #tcp

TESTDESC+=("# edns=0")
TESTS+=("${dig} +edns=0 +nocookie +noad @${srv_test} SOA ${domain} ${opts}") #edns0

TESTDESC+=("# edns=1")
TESTS+=("${dig} +edns=1 +noednsneg +nocookie +noad @${srv_test} SOA ${domain} ${opts}") #edns1

TESTDESC+=("# edns=0 with buffer 512b")
TESTS+=("${dig} +edns=0 +nocookie +noad +dnssec +ignore +bufsize=512 DNSKEY @${srv_test} ${domain} ${opts}") #ends@512

TESTDESC+=("# edns=0 with unknown option 100")
TESTS+=("${dig} +edns=0 +nocookie +noad +ednsopt=100 @${srv_test} SOA ${domain} ${opts}") #ednsopt

TESTDESC+=("# edns=1 with unknown option 100")
TESTS+=("${dig} +edns=1 +noednsneg +nocookie +noad +ednsopt=100 @${srv_test} SOA ${domain} ${opts}") #edns1opt

TESTDESC+=("# No cookie")
TESTS+=("${dig} +edns=0 +nocookie +noad +dnssec @${srv_test} SOA ${domain} ${opts}") # do

TESTDESC+=("# Known NS record")
TESTS+=("${dig} +edns=0 +nocookie +noad +dnssec +cd @${srv_test} SOA ${domain} ${opts}") #docd

TESTDESC+=("# Disable EDNS version negotiation")
TESTS+=("${dig} +edns=1 +noednsneg +nocookie +noad +dnssec @${srv_test} SOA ${domain} ${opts}") #edns1do

TESTDESC+=("# Disable edns negotiation and set custom flags")
TESTS+=("${dig} +edns=0 +nocookie +noad +ednsflags=0x0080 @${srv_test} SOA ${domain} ${opts}") #ednsflags

TESTDESC+=("# Set cookie with expiration")
TESTS+=("${dig} +edns=0 +noad +nsid +subnet=0.0.0.0/0 +expire +cookie=0102030405060708 @${srv_test} SOA ${domain} ${opts}") #ednssubnet

TESTDESC+=("# Ask for NSID")
TESTS+=("${dig} +edns=0 +nocookie +noad +nsid @${srv_test} SOA ${domain} ${opts}") #ednsid

TESTDESC+=("# Set edns cookie")
TESTS+=("${dig} +edns=0 +noad +cookie=0102030405060708 @${srv_test} SOA ${domain} ${opts}") #ednscookie

TESTDESC+=("# Set expiration without cookie")
TESTS+=("${dig} +edns=0 +nocookie +noad +expire @${srv_test} SOA ${domain} ${opts}") #ednsexpire

TESTDESC+=("# EDNS without cookie, and subnet")
TESTS+=("${dig} +edns=0 +nocookie +noad +subnet=0.0.0.0/0 +expire @${srv_test} SOA ${domain} ${opts}") #ednssubnet

TESTDESC+=("# edns=1 NSID")
TESTS+=("${dig} +edns=1 +noednsneg +nocookie +noad +nsid @${srv_test} SOA ${domain} ${opts}") #edns1nsid

TESTDESC+=("# edns=1 with cookie")
TESTS+=("${dig} +edns=1 +noednsneg +noad +cookie=0102030405060708 @${srv_test} SOA ${domain} ${opts}") #edns1cookie

TESTDESC+=("# edns=1 with expire")
TESTS+=("${dig} +edns=1 +noednsneg +nocookie +noad +expire @${srv_test} SOA ${domain} ${opts}") #edns1expire

TESTDESC+=("# edns=1 with subnet")
TESTS+=("${dig} +edns=1 +noednsneg +nocookie +noad +subnet=0.0.0.0/0 @${srv_test} SOA ${domain} ${opts}") #edns1subnet

TESTDESC+=("# edns-0 and TCP")
TESTS+=("${dig} +edns=0 +nocookie +noad +dnssec +bufsize=512 +tcp DNSKEY @${srv_test} ${domain} ${opts}") #ednstcp

TESTDESC+=("# Unknown TYPE 1000 ")
TESTS+=("${dig} +noedns +noad TYPE1000 @${srv_test} SOA ${domain} ${opts}") #type1000
#TESTS+=("${dig}  @${srv_test} SOA ${domain} ${opts}") # 

cont=1
run=0
for t in "${TESTS[@]}" ; do
 # IPv4 run UDP
	query="${t} -4 +notcp"
	echo "${TESTDESC[$((run))]} IPv4 UDP" > ${outputdir}/tests-$(printf "%04d" ${cont}).cmd
	echo "${query/$srv_test/$srv_expected}" >> ${outputdir}/tests-$(printf "%04d" ${cont}).cmd
	${query} > ${outputdir}/tests-$(printf "%04d" ${cont}).yaml
	cont=$((cont+1))
 # IPv4 run TCP
	query="${t} -4 +tcp"
	echo "${TESTDESC[$((run))]} IPv4 TCP" > ${outputdir}/tests-$(printf "%04d" ${cont}).cmd	
	echo "${query/$srv_test/$srv_expected}" >> ${outputdir}/tests-$(printf "%04d" ${cont}).cmd
    ${query} > ${outputdir}/tests-$(printf "%04d" ${cont}).yaml
	cont=$((cont+1))
 # IPv6 run UDP
	query="${t} -6 +notcp"
	echo "${TESTDESC[$((run))]} IPv6 UDP" > ${outputdir}/tests-$(printf "%04d" ${cont}).cmd	
	echo "${query/$srv_test/$srv_expected}" >> ${outputdir}/tests-$(printf "%04d" ${cont}).cmd
    ${query} > ${outputdir}/tests-$(printf "%04d" ${cont}).yaml
	cont=$((cont+1))
 # IPv6 run TCP
	query="${t} -6 +tcp"
	echo "${TESTDESC[$((run))]} IPv6 TCP" > ${outputdir}/tests-$(printf "%04d" ${cont}).cmd		
	echo "${query/$srv_test/$srv_expected}" >> ${outputdir}/tests-$(printf "%04d" ${cont}).cmd
    ${query} > ${outputdir}/tests-$(printf "%04d" ${cont}).yaml
	cont=$((cont+1))
	run=$((run+1))
done
