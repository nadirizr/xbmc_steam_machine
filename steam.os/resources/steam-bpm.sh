#!/bin/bash

if [[ $(pidof steam) ]] ; then
    steam steam://open/bigpicture
else
    steam -bigpicture
fi

