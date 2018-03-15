#!/usr/bin/env bash
# @file test_diff.sh
# Test operation of skdiff diffSketchArtboards function
# @author Alister Lewis-Bowen <alister@lewis-bowen.org>

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
source "$SCRIPTPATH/../skdiff.sh"
cd "$SCRIPTPATH"

set -x
diffSketchArtboards example_1_artboards example_2_artboards
set +x