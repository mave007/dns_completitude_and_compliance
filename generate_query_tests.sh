#!/bin/bash

# Create tests based the ones already made on:
# RSSAC047 (section 5.3) - https://www.icann.org/en/system/files/files/rssac-047-12mar20-en.pdf
# ISC DNS Compliance-Testing - https://gitlab.isc.org/isc-projects/DNS-Compliance-Testing

dig=$(which dig)
opts="+dnssec +norec +time=2 +tries=1 +noignore +yaml"
srv-ok="ns.cero32.cl."
srv-expected="secundario.nic.cl."
domain="cero32.cl"
outputdir="tests"


TESTS+=("${dig} ${domain} SOA @${srv-ok} ${opts}") 
TESTS+=("${dig} ${domain} DNSKEY @${srv-ok} ${opts}") 
TESTS+=("${dig} ${domain} NS @${srv-ok} ${opts}") 
TESTS+=("${dig} www.rssac047-test.zyxwvutsrqp A @${srv-ok} ${opts}") 
TESTS+=("${dig} us DS @${srv-ok} ${opts} ") 
TESTS+=("${dig} us NS @${srv-ok} ${opts} ") 
TESTS+=("${dig} cm NS @${srv-ok} ${opts} ") 
TESTS+=("${dig} cl NS @${srv-ok} ${opts} ") 
TESTS+=("${dig} by NS @${srv-ok} ${opts} ")
TESTS+=("${dig} +noedns +noad SOA ${domain} @${srv-ok} ${opts} ") # dns
TESTS+=("${dig} +noedns +noad +aaflag SOA ${domain} @${srv-ok} ${opts} ") # aa
TESTS+=("${dig} +noedns +ad +cd SOA ${domain} @${srv-ok} ${opts} ") # ad
TESTS+=("${dig} +noedns +noad +cd SOA ${domain} @${srv-ok} ${opts} ") # cd
TESTS+=("${dig} +noedns +noad +cd +raflag SOA ${domain} @${srv-ok} ${opts} ") # ra
TESTS+=("${dig} +noedns +noad SOA ${domain} @${srv-ok} ${opts/+norec/+rec} ") # rd
TESTS+=("${dig} +noedns +noad +tcflag SOA ${domain} @${srv-ok} ${opts} ") # tc
TESTS+=("${dig} +noedns +noad +zflag SOA ${domain} @${srv-ok} ${opts} ") # zflag
TESTS+=("${dig} +noedns +noad +header-only +opcode=15 @${srv-ok} ${opts} ") # opcode
TESTS+=("${dig} +noedns +header-only +opcode=15 +tcflag +raflag +cd +ad +aaflag +zflag ${opts/+norec/+rec} @${srv-ok}") # opcodeflg
TESTS+=("${dig} +noedns +noad TYPE666 @${srv-ok} SOA ${domain} ${opts}") # type666
TESTS+=("${dig} +noedns +noad +tcp @${srv-ok} SOA ${domain} ${opts}") #tcp
TESTS+=("${dig} +edns=0 +nocookie +noad @${srv-ok} SOA ${domain} ${opts}") #edns0
TESTS+=("${dig} +edns=1 +noednsneg +nocookie +noad @${srv-ok} SOA ${domain} ${opts}") #edns1
TESTS+=("${dig} +edns=0 +nocookie +noad +dnssec +ignore +bufsize=512 DNSKEY @${srv-ok} ${domain} ${opts}") #ends@512
TESTS+=("${dig} +edns=0 +nocookie +noad +ednsopt=100 @${srv-ok} SOA ${domain} ${opts}") #ednsopt
TESTS+=("${dig} +edns=1 +noednsneg +nocookie +noad +ednsopt=100 @${srv-ok} SOA ${domain} ${opts}") #edns1opt
TESTS+=("${dig} +edns=0 +nocookie +noad +dnssec @${srv-ok} SOA ${domain} ${opts}") # do
TESTS+=("${dig} +edns=0 +nocookie +noad +dnssec +cd @${srv-ok} SOA ${domain} ${opts}") #docd
TESTS+=("${dig} +edns=1 +noednsneg +nocookie +noad +dnssec @${srv-ok} SOA ${domain} ${opts}") #edns1do
TESTS+=("${dig} +edns=0 +nocookie +noad +ednsflags=0x0080 @${srv-ok} SOA ${domain} ${opts}") #ednsflags
TESTS+=("${dig} +edns=0 +noad +nsid +subnet=0.0.0.0/0 +expire +cookie=0102030405060708 @${srv-ok} SOA ${domain} ${opts}") #optlist
TESTS+=("${dig} +edns=0 +nocookie +noad +nsid @${srv-ok} SOA ${domain} ${opts}") #ednsid
TESTS+=("${dig} +edns=0 +noad +cookie=0102030405060708 @${srv-ok} SOA ${domain} ${opts}") #ednscookie
TESTS+=("${dig} +edns=0 +nocookie +noad +expire @${srv-ok} SOA ${domain} ${opts}") #ednsexpire
TESTS+=("${dig} +edns=0 +nocookie +noad +expire @${srv-ok} SOA ${domain} ${opts}") #ednssubnet
TESTS+=("${dig} +edns=1 +noednsneg +nocookie +noad +nsid @${srv-ok} SOA ${domain} ${opts}") #edns1nsid
TESTS+=("${dig} +edns=1 +noednsneg +noad +cookie=0102030405060708 @${srv-ok} SOA ${domain} ${opts}") #edns1cookie
TESTS+=("${dig} +edns=1 +noednsneg +nocookie +noad +expire @${srv-ok} SOA ${domain} ${opts}") #edns1expire
TESTS+=("${dig} +edns=1 +noednsneg +nocookie +noad +subnet=0.0.0.0/0 @${srv-ok} SOA ${domain} ${opts}") #edns1subnet
TESTS+=("${dig} +edns=0 +nocookie +noad +dnssec +bufsize=512 +tcp DNSKEY @${srv-ok} ${domain} ${opts}") #ednstcp
TESTS+=("${dig} +noedns +noad TYPE1000 @${srv-ok} SOA ${domain} ${opts}") #type1000
#TESTS+=("${dig}  @${srv-ok} SOA ${domain} ${opts}") # 

cont=1
for t in "${TESTS[@]}" ; do
 # IPv4 run UDP
	query="${t} -4 +notcp +bufsize=1220 +edns=0"
	echo "${query/$srv-ok/$srv-expected}" > ${outputdir}/tests-$(printf "%04d" ${cont}).cmd
	${query} > ${outputdir}/tests-$(printf "%04d" ${cont}).yaml
	cont=$((cont+1))
 # IPv4 run TCP
	query="${t} -4 +tcp"
	echo "${query/$srv-ok/$srv-expected}" > ${outputdir}/tests-$(printf "%04d" ${cont}).cmd
    ${query} > ${outputdir}/tests-$(printf "%04d" ${cont}).yaml
	cont=$((cont+1))
 # IPv6 run UDP
	query="${t} -6 +notcp +bufsize=1220 +edns=0"
	echo "${query/$srv-ok/$srv-expected}" > ${outputdir}/tests-$(printf "%04d" ${cont}).cmd
    ${query} > ${outputdir}/tests-$(printf "%04d" ${cont}).yaml
	cont=$((cont+1))
 # IPv6 run TCP
	query="${t} -6 +tcp"
	echo "${query/$srv-ok/$srv-expected}" > ${outputdir}/tests-$(printf "%04d" ${cont}).cmd
    ${query} > ${outputdir}/tests-$(printf "%04d" ${cont}).yaml
	cont=$((cont+1))
done
