#!/usr/bin/env python3
from deepdiff import DeepDiff  # For Deep Difference of 2 objects
import yaml
import argparse
import shlex
import subprocess
import re

# Function to compare
def compare_query_result(expected_yaml, result, excludelist):
	ok_test = yaml.load(open(expected_yaml), Loader=yaml.FullLoader)
	#compare = yaml.load(open(result), Loader=yaml.FullLoader)
	#print (yaml.dump(ok_test))
	#print (yaml.dump(result))
	#assert not DeepDiff(ok_test,compare, ignore_order=True, verbose_level=0, view='tree', exclude_paths=excludelist)
	ddiff = DeepDiff(ok_test, result, ignore_order=True, verbose_level=0, view='tree', exclude_paths=excludelist)
	if (ddiff == {} ):
		print ("  PASS")
	else:
		p = re.compile('root\[0\]')
		print(p.sub('',ddiff.pretty()))
	return ddiff

def run_dns_query(cmd):
	#print (cmd)
	cmd_output = subprocess.check_output(cmd).decode()
	result     = yaml.load(cmd_output, Loader=yaml.FullLoader)
	#print (yaml.dump(result, default_flow_style=False))
	return result

if __name__ == "__main__":
	parser = argparse.ArgumentParser(description= "Compare DNS outputs stored in YAML format")
	parser.add_argument("expected_yaml", help="Correct (expected_yaml) DNS YAML file")
	parser.add_argument("queryfile_cmd", help="File with dig query to run")
	args = parser.parse_args()
	
	exclude = ("root[0]['message']['query_port']",
		"root[0]['message']['query_time']",
		"root[0]['message']['response_time']",
		"root[0]['message']['response_message_data']['OPT_PSEUDOSECTION']['EDNS']['COOKIE']",
		"root[0]['message']['response_message_data']['OPT_PSEUDOSECTION']['EDNS']['NSID']",
		"root[0]['message']['response_message_data']['id']",
		"root[0]['message']['response_address']")
	
	#dig    = '/usr/local/bin/dig'
	#server = 'ns.cero32.cl.'
	#query  = 'cero32.cl SOA'
	#e_args = '-4 +norec'
	#output = '+yaml'
	
	#file_query = open(args.queryfile_cmd, "r")
	for line in open(args.queryfile_cmd, "r"):
		# print (line)
		li=line.strip()
		if not li.startswith("#"):
			cmd = shlex.split(line.rstrip())
	#print (cmd)		
	#file_query.close()
	#cmd = shlex.split(dig +' @' + server + ' ' + query + ' ' + e_args + ' ' + output)
	compare_query_result(args.expected_yaml,run_dns_query(cmd),exclude)
