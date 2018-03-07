#!/usr/bin/env bash
# @file skdiff.sh
# Show artboard changes between two versions of the same sketch file
# @author Alister Lewis-Bowen <alister@lewis-bowen.org>

[[ "$OSTYPE" == "darwin"* ]] || {
    echo "This will only run on macOS"
    exit 1
}

[[ -e /Applications/Sketch.app/Contents/Resources/sketchtool/bin/sketchtool ]] || {
    echo "Unable to find sketchtool under your Sketch application directory"
    exit 1
}
sketch=/Applications/Sketch.app/Contents/Resources/sketchtool/bin/sketchtool

type blink-diff &> /dev/null || {
    type npm &> /dev/null || {
        echo "To run image different detection you need to install blink-diff"
        echo "using the node package manage (npm). Please install npm."
        echo "Instructions at https://www.npmjs.com/get-npm"
        exit 1
    }
    echo "Installing blink-diff..."
    npm install -g blink-diff
}

exportSketchArtboards () {

    local file="$1"
    local dir="${file%.sketch}_artboards"
    [ -d "$dir" ] && rm -fR "$dir"

    "$sketch" export artboards ${file} --overwriting="YES" --include-symbols="NO" --output="${dir}" > /dev/null

    return 0
}

diffSketchArtboards () {

    local dir_a="$1"
    local dir_b="$2"
    local odir="${3:-changes}"
    [ -d "$odir" ] && rm -fR "$odir"
    mkdir -p  "$odir/changed" "$odir/added" "$odir/deleted"

    while IFS= read -r _line; do
        _differ=$(echo "$_line" | sed -En 's#^Files (.*) and (.*) differ$#\1#p')
        _added=$(echo "$_line" | sed -En "s#^Only in ${dir_b}: (.*\.png)\$#\1#p")
        _removed=$(echo "$_line" | sed -En "s#^Only in ${dir_a}: (.*\.png)\$#\1#p")
        if [[ ! -z "$_differ" ]]; then
            _file="$(basename $_differ)"
            blink-diff --compose-ltr --output "$odir/changed/$_file" "$dir_a/$_file" "$dir_b/$_file"
        elif [[ ! -z "$_added" ]]; then
            cp "$dir_b/$_added" "$odir/added/$_added"
        elif [[ ! -z "$_removed" ]]; then
            cp "$dir_a/$_removed" "$odir/deleted/$_removed"
        fi
    done < <(diff -rq "$dir_a" "$dir_b")

    return 0
}

genGitHook () {

    local git_root=$(git rev-parse --show-toplevel)
    [[ -e "$git_root" ]] || {
        echo "You don't appear to be in a git repository"
        exit 1
    }

    return 0
}