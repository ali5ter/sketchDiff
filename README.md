# skdiff
Command to generate visual differences between two sketch files

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

### What is the difference between these two Sketch files?
`skdiff example_1.sketch example_2.sketch` will provide a summary of what
artboards have been added, deleted or changes between the two files, e.g.

The `changes` directory will be generate the same way as described above.

## Installation
When `skdiff` is first run all prerequsites will be checked:

1. You're running `skdiff` on macOS
2. You have Sketch installed
3. You have NPM installed

The `blink-diff` utility will be installed using NPM which is used to generate 
a composite of two images.

`skdiff` will also be symbolically linked from `/usr/local/bin` so it appears
in the shell path.