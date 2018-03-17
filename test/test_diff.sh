#!/usr/bin/env bash
# @file test_diff.sh
# Test operation of skdiff diffSketchArtboards function
# @author Alister Lewis-Bowen <alister@lewis-bowen.org>

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
cd "$SCRIPTPATH"

[[ "$1" == '-d' ]] && set -x
source ../skdiff

diffSketchArtboards ~/.skdiff/example_1_artboards \
    ~/.skdiff/example_2_artboards