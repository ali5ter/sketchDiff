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

continueDialog() {
    local msg="$1"
	osascript >/dev/null <<END_OF_APPLESCRIPT
set theDialogText to "$msg"
display dialog theDialogText \
    with title "skdiff test" \
    buttons {"Continue"} default button "Continue"
END_OF_APPLESCRIPT
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
continueDialog "The '$OUTPUT_DIR' folder will be removed. \nContinue when you are ready to run the remianing tests."

heading "diff summary and output to '$OUTPUT_DIR' with no messages or finder"
cleanup
skdiff example_1.sketch example_2.sketch \
    --output "$OUTPUT_DIR" -q --no-finder

heading "diff summary only with no finder"
cleanup
skdiff example_1.sketch example_2.sketch \
    --no-output --no-finder

heading "diff against previous version when file not tracked"
cleanup
cp example_1.sketch test.sketch
skdiff example_1.sketch
skdiff test.sketch
rm test.sketch