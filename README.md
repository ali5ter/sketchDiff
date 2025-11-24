# skdiff
Command to generate visual differences between two sketch files. Useful as a `git diff` for your Sketch files.

This is a bash script that will run in your macOS using Terminal app.

![screencast demo of skdiff](https://raw.githubusercontent.com/ali5ter/sketchDiff/master/skdiff_demo.gif)

## Usage
`skdiff -h` for help information

### What changed since the last commit of this Sketch file?
`skdiff example_1.sketch` will check if this file is tracked by git and, if it
is, will provide a summary of what artboards have been added, deleted or
changed.

    <> S1_10.png has changed
    -- S1_End.png removed
    <> S1___Overview@2x.png has changed
    ++ S2___Overview@2x.png added

A directory called `changes` is written to the current directory that contains
all the artboards listed in this summary. 

**Artboards that have changed are
represented by a composite image of the before, after and overlayed before and
after artboards using red coloring to highlight the specific changes.**
![](test/composite.png)

### Using the functionality of skdiff as part of another script
`skdiff` is written so the internal functions can be called from your own 
bash script. Just source the `skdiff` script and you'll have access to its
variables and functions.

## Installation
Run the following command to download and install

    curl https://raw.githubusercontent.com/ali5ter/sketchDiff/master/skdiff -o skdiff && chmod 755 skdiff && mv skdiff /usr/local/bin/

`skdiff` will check the following prerequisites:

1. You're running `skdiff` on macOS
2. You have Sketch installed
3. You have NPM installed
4. You have `blink-diff` installed. If you're familiar with npm, you could install this manually using 

        npm install -g blink-diff

The `blink-diff` utility is used to generate the composite of two images. `skdiff` will attempt to install this utility if npm is present but the utility is not.
