#!/usr/bin/env bash
# @file test_gen_githook.sh
# Test operation of skdiff genGitHook function
# @author Alister Lewis-Bowen <alister@lewis-bowen.org>

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
cd "$SCRIPTPATH"

[[ "$1" == '-d' ]] && set -x
source ../skdiff

genGitHook