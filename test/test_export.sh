#!/usr/bin/env bash
# @file test_export.sh
# Test operation of skdiff exportSketchArtboards function
# @author Alister Lewis-Bowen <alister@lewis-bowen.org>

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
source "$SCRIPTPATH/../skdiff.sh"
cd "$SCRIPTPATH"

[[ "$1" == '-d' ]] && set -x
exportSketchArtboards example_1.sketch
exportSketchArtboards example_2.sketch