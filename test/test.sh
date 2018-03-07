#!/usr/bin/env bash
# @file test.sh
# Test operation of skdiff
# @author Alister Lewis-Bowen <alister@lewis-bowen.org>

set -x

source ../skdiff.sh

exportSketchArtboards example_1.sketch
exportSketchArtboards example_2.sketch

diffSketchArtboards example_1_artboards example_2_artboards

set +x