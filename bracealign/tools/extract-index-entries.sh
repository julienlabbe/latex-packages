#!/usr/bin/env sh
#
# extract list index entries for bracealign package
#
# Copyright (C) 2023 by Julien Labbé <Julien.Labbe@univ-grenoble-alpes.fr>
#
# This file may be distributed and/or modified under the conditions of the
# LaTeX Project Public License (LPPL), either version 1.3c of this license or
# (at your option) any later version. The latest version of this license is in
# the file https://www.latex-project.org/lppl.txt
#
# Reminder: command awk '!line[$0]++' remove duplicate lines

name=bracealign
dir=..

# List of package options
rg -o -N 'DeclareOption\{\w+' ${dir}/${name}.dtx | rg -o '\w+$' \
    > list-of-options.txt

# List of commands
rg  -oN '^[[:blank:]]*\\(New|Renew|Declare|Provides)\w*Command\s*\{\s*\\\w+' ../bracealign.sty \
    | rg -o '\\\w+$' | sed 's/^\\//' \
    > list-of-commands.txt
(cd .. ;  latexdef -ll -p ${name}) | rg "^\\\\bracealign_[\w_:]+" -o \
    | sort | uniq | sed 's/^\\//' \
    >> list-of-commands.txt

# List of environments
rg  -oN '^[[:blank:]]*\\(New|Renew|Declare|Provides)\w*Environment\s*\{\s*\w+' ../bracealign.sty | rg -o '\w+$' \
    > list-of-environments.txt

# List of internal commands and variables
(cd .. ;  latexdef -LL -p ${name}) | rg "^\\\.?__${name}[\w_:]+" -o | sed 's/:$//' \
    | sort | uniq \
    | sed "s/__${name}/@@@@/"  | sed 's/^\\//' \
    > list-of-internals.txt

# List of keys
(cd .. ;  latexdef -ll -p ${name}) | rg "key.*${name}" | rg "${name}/.*" -o | rg -v "/(true|false|unknown)$"\
    | sort | uniq \
    > list-of-keys.txt
