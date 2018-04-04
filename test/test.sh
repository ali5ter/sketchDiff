#!/usr/bin/env bash
# @file test.sh
# Test skdiff
# @author Alister Lewis-Bowen <alister@lewis-bowen.org>

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
skdiff="$SCRIPTPATH/../skdiff"
cd "$SCRIPTPATH"

OUTPUT_DIR='test_changes'

[[ "$1" == '-d' ]] && set -x

heading() {
    echo
    printf '=%.0s' {1..79}
    echo -e "\n$1" | fold -s -w 79
    printf -- '-%.0s' {1..79}
    echo
    return 0
}

cleanup() {
    rm -fR "$OUTPUT_DIR" 'changes'
}

heading 'display help'
skdiff

heading "validate 'foo' & 'bar' exist"
skdiff foo bar

heading "validate 'test.sh' is a sketch file & 'bar' exists"
skdiff test.sh bar

heading "validate 'foo' exists & 'test.sh' is a sketch file"
skdiff foo test.sh

heading "validate 'test.sh' & 'composite.png' are sketch files"
skdiff test.sh composite.png

heading "diff summary and output to '$OUTPUT_DIR'"
cleanup
skdiff example_1.sketch example_2.sketch \
    --output "$OUTPUT_DIR"

heading "diff summary and output to '$OUTPUT_DIR' with no messages"
cleanup
skdiff example_1.sketch example_2.sketch \
    --output "$OUTPUT_DIR" -q

heading "diff summary only"
cleanup
skdiff example_1.sketch example_2.sketch \
    --no-output