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

function testCdHistoryPosGet__WhenListDoesNotExist_ReturnFalse
{
	assert_raises "cd_history_pos_get" 1
}

function testCdHistoryPosNext_WhenListDoesNotExist_WhenPosIsEmpty_ReturnFalse
{
	assert_raises "cd_history_pos_next \"${test_history}\" \"\"" 1
}

function testCdHistoryPosGet_WhenListExists_WhenListIsEmpty_ReturnFalse
{
	touch "${test_history}"
	assert_raises "cd_history_pos_get \"${test_history}\"" 1
}

function testCdHistoryPosNext_WhenListIsEmpty_ReturnFalse
{
	touch "${test_history}"
	assert_raises "cd_history_pos_next \"${test_history}\" \"\"" 1
}

function testCdHistoryPosNext_WhenListContainsOneElement_WhenPosIsNotDefined_ReturnLastElement
{
	touch "${test_history}"
	list_put "${test_history}" "entry-1"
	assert "cd_history_pos_next \"${test_history}\"" "1"
}

function testCdHistoryPosNext_WhenListContainsTwoElements_WhenPosIsOne_ReturnTwo
{
	touch "${test_history}"
	list_put "${test_history}" "entry-1"
	list_put "${test_history}" "entry-2"
	assert "cd_history_pos_next \"${test_history}\"" "2"
}

function testCdHistoryPosNext_WhenListContainsTwoElements_WhenPosIsGreaterThree_ReturnTwo
{
	touch "${test_history}"
	list_put "${test_history}" "entry-1"
	list_put "${test_history}" "entry-2"
	test_history_size=$(list_size "${test_history}")
	assert "cd_history_pos_next \"${test_history}\" \"${test_history_size}\"" "${test_history_size}"
	assert "cd_history_pos_next \"${test_history}\" \"$(expr ${test_history_size} + 1)\"" "${test_history_size}"
}

function testCdHistoryPosPrev_WhenListContainsTwoElements_WhenPosIsTwo_ReturnOne
{
	touch "${test_history}"
	list_put "${test_history}" "entry-1"
	list_put "${test_history}" "entry-2"
	assert "cd_history_pos_prev \"${test_history}\" 2" "1"
}

function testCdHistoryPosPrev_WhenListContainsOneElement_WhenPosIsOne_ReturnFalse
{
	touch "${test_history}"
	list_put "${test_history}" "entry-1"
	list_put "${test_history}" "entry-2"
	assert "cd_history_pos_prev \"${test_history}\" 1" "1"
}

function testCdHistoryPosPrev_WhenListContainsOneElement_WhenPosIsZero_ReturnFalse
{
	touch "${test_history}"
	list_put "${test_history}" "entry-1"
	list_put "${test_history}" "entry-2"
	assert "cd_history_pos_prev \"${test_history}\" 0" "1"
}

run_tests
