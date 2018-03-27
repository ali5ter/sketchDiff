#!/usr/bin/env bash
# @file test.sh
# Test skdiff
# @author Alister Lewis-Bowen <alister@lewis-bowen.org>

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
skdiff="$SCRIPTPATH/../skdiff"
cd "$SCRIPTPATH"

[[ "$1" == '-d' ]] && set -x

skdiff

skdiff foo bar
skdiff example_1_artboards bar
skdiff foo example_1_artboards
skdiff example_1_artboards example_2_artboards
skdiff example_1.sketch example_1_artboards

skdiff example_1.sketch example_2.sketch \
    --output test_changes

skdiff example_1.sketch example_2.sketch \
    --output test_changes -q