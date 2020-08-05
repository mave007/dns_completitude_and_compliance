# DNS Completitude and Compliance testing

The objective of this set of scripts, is to create a comparison point
between a known server implementation and a test target, by using the
capabilities of ISC bind utility `dig` and its `+yaml` output.

## Motivation
Verify that all the core DNS capabilities for a server are compatible
and compliant to the IETF standard to ensure interoperation Security,
Stability and Resiliency of the Domain Name System.

This tool is meant to be integrated as unittest for a CI/CD deployment
environment, while creating an easy and quick way to introduce new
tests. You will only need 2 files per test: A comparisson YAML output
and an dig command to test that capability.

### Use cases
- Test a DNS implementation before a patch or upgrade is done to note
behavior changes between the versions.
- Test a different DNS implementation from another vendor that you
would like to introduce into your infrastructure and test if it has
the same capabilities


# Requirements

- dig (bind-utils or dnsutils) > 9.15
- Python libraries (via pip3):
  - PyYAML
  - argparse
  - shlex
  - subprocess
  - DeepDiff

# Usage:
Create a command line dig command with the query you want to perform
and store that in a file. For example `test-001.cmd`:

```bash
echo /usr/local/bin/dig cero32.cl SOA @ns.cero32.cl +dnssec +norec +time=2 +tries=1 +noignore +yaml -4 +notcp +bufsize=1220 +edns=0  > test-001.cmd
```

Then create an expected result in YAML format in another file.

```bash
/usr/local/bin/dig cero32.cl SOA @secundario.nic.cl +dnssec +norec +time=2 +tries=1 +noignore +yaml -4 +notcp +bufsize=1220 +edns=0 > test-001.yaml
```

To compare both results using `dns-comp.py` utility. If no difference is shown, it will look like this:

```bash
./dns-comp.py test-001.yaml test-001.cmd
  PASS
```

If a difference is found, then it will look like this:

```
./dns-comp.py test-cero32_cl-001.yaml test-cero32_cl-001.desc
Item ['message']['response_message_data']['ADDITIONAL_SECTION'][2] removed from iterable.
Item ['message']['response_message_data']['ADDITIONAL_SECTION'][3] removed from iterable.
Value of ['message']['message_size'] changed from "744b" to "704b".
Value of ['message']['response_message_data']['ADDITIONAL'] changed from 5 to 3.
Item ['message']['response_message_data']['ANSWER_SECTION'][1] removed from iterable.
Item ['message']['response_message_data']['AUTHORITY_SECTION'][3] removed from iterable.
Item ['message']['response_message_data']['ADDITIONAL_SECTION'][1] removed from iterable.
```

## Creating multiple tests
With the utility `generate_query_tests.sh` you can create several already pre-made tests and outputs, based on
- RSSAC047 (section 5.3) - https://www.icann.org/en/system/files/files/rssac-047-12mar20-en.pdf
- ISC DNS Compliance-Testing - https://gitlab.isc.org/isc-projects/DNS-Compliance-Testing

Follow the variables on top of this script to modify its default values:
- `${dig}`: Location of dig binary (> 9.15)
- `${outputdir}`: Where to store the tests
- `${domain}`: Target domain that you will test
- `${srv-ok}`: Server you will store the target YAML output
- `${srv-expected}`: Server that you will query to compare against

## TL-DR:
```bash
mkdir tests
./generate_query_tests.sh
./run-all-tests.sh
```
