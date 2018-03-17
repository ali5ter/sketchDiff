#!/usr/bin/env bash
# @file test_export.sh
# Test operation of skdiff exportSketchArtboards function
# @author Alister Lewis-Bowen <alister@lewis-bowen.org>

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
cd "$SCRIPTPATH"

[[ "$1" == '-d' ]] && set -x
source ../skdiff

exportSketchArtboards example_1.sketch
exportSketchArtboards example_2.sketch