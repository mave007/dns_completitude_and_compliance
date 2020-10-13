#!/usr/bin/env python3
from deepdiff import DeepDiff  # For Deep Difference of 2 objects
import yaml
import argparse
import shlex
import subprocess
import re
from pprint import pprint

# Function to compare 1 YAML output (expected_yaml) with a dict output (output_cmd) and ignore (excludelist) items
def compare_query_result(expected_yaml, output_cmd, excludelist):
	result  = yaml.safe_load(open(expected_yaml))
	ok_test = {}
	for doc in result:
		for k,v in doc.items():
			ok_test[k]=v
	#print ("ok_test:", type(ok_test))
	#print ("output_cmd:",  type(output_cmd))
	ddiff = DeepDiff(ok_test, output_cmd, ignore_order=True, verbose_level=2, view='tree', exclude_paths=excludelist)
	if (ddiff == {} ):
		print ("  PASS")
	else:
		p = re.compile('root')
		print(p.sub('',ddiff.pretty()))
		#pprint(ddiff.get_stats())
	return ddiff

# Function to return a dict with DIG command output
def run_dns_query(cmd):
	#print (cmd)
	my_dict    = {}
	cmd_output = subprocess.check_output(cmd).decode()
	result     = yaml.safe_load(cmd_output)
	for doc in result:
		for k,v in doc.items():
			my_dict[k]=v
	return my_dict

# Main
if __name__ == "__main__":
	# Parsing arguments
	parser = argparse.ArgumentParser(description= "Compare DNS outputs stored in YAML format")
	parser.add_argument("expected_yaml", help="Correct (expected_yaml) DNS YAML file")
	parser.add_argument("queryfile_cmd", help="File with dig query to run")
	args = parser.parse_args()
	
	# Exclusion list (ignore part of message)
	exclude = ["root['message']['query_port']",
	"root['message']['query_time']",
	"root['message']['response_time']",
	"root['message']['response_message_data']['OPT_PSEUDOSECTION']['EDNS']['COOKIE']",
	"root['message']['response_message_data']['OPT_PSEUDOSECTION']['EDNS']['NSID']",
	"root['message']['response_message_data']['id']",
	"root['message']['response_address']"]

	# Open File with query command (if starts with "#" that is considered the comment/name of the command below)
	for line in open(args.queryfile_cmd, "r"):
		# print (line)
		li=line.strip()
		if not li.startswith("#"):
			cmd = shlex.split(line.rstrip())
	#print (cmd)
	diff = compare_query_result(args.expected_yaml,run_dns_query(cmd),exclude)
	
	#Processing the differences
	#added = {}
	#removed = {}
	#changed = {}
	#changed_types = {}
	#if 'dictionary_item_added' in diff.keys():
	#	for old_key, value in diff.get('dictionary_item_added', {}).items():
	#		added[root_cleanup(old_key)] = value
	#		print (value)
	#if 'dictionary_item_removed' in diff.keys():
	#	for old_key, value in diff.get('dictionary_item_removed', {}).items():
	#		removed[root_cleanup(old_key)] = value
	#		print (value)
	#if 'dictionary_item_removed' in diff.keys():
	#	for old_key, value in diff.get('values_changed', {}).items():
	#		changed[root_cleanup(old_key)] = value
	#		print (value)
	#if 'dictionary_item_removed' in diff.keys():
	#	for old_key, value in diff.get('type_changes', {}).items():
	#		changed_types[root_cleanup(old_key)] = value
	#		print (value)

	# Have to recast the values as dictionaries and combine type/value changes
	#for key in changed:
	#	print ("Changes done:")
	#	print (changed[key])
	#for key in changed_types:
	#	print ("Type changes done:")
	#	print (changed_types[key])


