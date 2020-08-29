#!/bin/bash
sudo make uninstall
rm -f config.def.h.orig config.h st st.o x.o
cp ../config.def.h .
patch -i st-tell-me-the-truth.diff
sudo make clean install
