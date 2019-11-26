#!/bin/bash

wget -q -O VSCode-linux-x64.tar.gz https://go.microsoft.com/fwlink/?LinkID=620884
tar -zxf VSCode-linux-x64.tar.gz
rm VSCode-linux-x64.tar.gz
mv VSCode-linux-x64 .VSCode-linux-x64

if ! grep -q "alias vscode" ~/.bashrc; then
    echo "alias vscode=$(pwd)/.VSCode-linux-x64/bin/code" >> ~/.bashrc
    source ~/.bashrc
fi
mkdir -p EidP/ue00
echo "---
BasedOnStyle: LLVM
IndentWidth: 4
ColumnLimit: 100
TabWidth: 4
UseTab: ForIndentation
BreakBeforeBraces: Attach
AlignEscapedNewlines: DontAlign
AllowShortFunctionsOnASingleLine: Empty
AllowShortIfStatementsOnASingleLine: false
IndentCaseLabels: false
AllowShortCaseLabelsOnASingleLine: true
Cpp11BracedListStyle: false
...
" > EidP/.clang-format
echo "int 
main
(    )
                { return 0;
    }" > EidP/malformed.c
echo "Done! Please close the terminal."
#gnome-terminal
#exit
