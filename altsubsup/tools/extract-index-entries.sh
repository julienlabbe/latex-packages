#!/usr/bin/env sh
#
# extract list index entries for altsubsup package
#
# Copyright (C) 2023 by Julien Labbé <Julien.Labbe@univ-grenoble-alpes.fr>
#
# This file may be distributed and/or modified under the conditions of the
# LaTeX Project Public License (LPPL), either version 1.3c of this license or
# (at your option) any later version. The latest version of this license is in
# the file https://www.latex-project.org/lppl.txt
#
# Reminder: command awk '!line[$0]++' remove duplicate lines

name=altsubsup
dir=..

# List of package options
rg -o -N 'DeclareOption\{\w+' ${dir}/${name}.dtx | rg -o '\w+$' \
    > list-of-options.txt

# List of commands
rg -o -N '^[[:blank:]]*\\(let|def|newcommand\*?|(New|Renew|Declare|Provides)\w*Command)[{\\]+[\w@]+' ${dir}/${name}.sty \
    | rg -o '[\w@]+$' | grep -v altsbsp@ | awk '!line[$0]++' \
    > list-of-commands.txt

# List of internal macros and lengths
rg '\\(if)?altsbsp@[\w@]+' -o  -N ${dir}/${name}.dtx | rg -v '(@true|@false)' | awk '!line[$0]++' \
    > list-of-internals.txt

# List of lengths
rg -o -N '^[[:blank:]]*\\(def|new)length[{\\]+[\w@]+' ${dir}/${name}.sty | rg -o '[\w@]+$' \
    | grep -v altsbsp@| awk '!line[$0]++' \
    > list-of-lengths.txt

# List of keys
rg -o -N ".*/\." ${dir}/${name}.sty | sed 's/\/\.$//' | sed -r 's/^([[:blank:]]|\\[[:alpha:]@]+\{)*//' \
    | awk '!line[$0]++' \
    > list-of-keys.txt
