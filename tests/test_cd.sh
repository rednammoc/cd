#!/bin/bash
. ../lib/assert.sh/assert.sh
. ../cd

test_history=history.list
test_history_size=

function setup
{
	rm -f "${test_history}"
}

function tear_down
{
	echo -n ""
}

function run_tests
{
	test_functions=$(cat $BASH_SOURCE | grep "function test" | tail -n+2 | cut -f2 -d' ')
	for test in ${test_functions}
	do
		setup
		eval $test
		tear_down
	done
	assert_end "cd"
}

function testCd_ToSubdirectory_AddsSubdirectoryToCdHistory
{
	
}

run_tests
