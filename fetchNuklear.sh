#!/bin/bash
echo "Checking if Nuklear Folder exists..."
function drawProgress(){
echo -n "[ "
for ((i = 0 ; i <= $1; i++)); do echo -n "###"; done
for ((j = i ; j <= $2 ; j++)); do echo -n "   "; done
v=$(( ($1 * 100) / $2 ))
echo -n " ] "
echo -n "$v %" $'\r'
echo
}

if [[ -d "QECN/Nuklear/" ]]
then
    exit
fi

if [[ -d "QECN/Nuklear/" ]]
then
    exit
fi

echo "Fetching Nuklear Headers..."
drawProgress 0 2
wget --quiet https://raw.githubusercontent.com/Immediate-Mode-UI/Nuklear/master/nuklear.h -P QECN/Nuklear/
drawProgress 1 2

wget --quiet https://raw.githubusercontent.com/Immediate-Mode-UI/Nuklear/master/demo/sdl_opengl3/nuklear_sdl_gl3.h -P QECN/Nuklear/
drawProgress 2 2

echo "Headers Fetched."

echo "Nuklear has been downloaded/updated."
