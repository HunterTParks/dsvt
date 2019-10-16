#!/bin/bash

# This bash file will dDetect changes in .less file and automatically compile into .css
# This is based on this Stack Overflow post -- https://stackoverflow.com/questions/13671969/how-to-automatically-compile-less-into-css-on-the-serverA
# Answers go to romanish

less="./src/less/"
lessfile="./src/less/App.less"
css="./src/App.css"

start_lesscwatch() {
	inotifywait $less -m -e modify | while read x op f; do
	    echo "$f"
	    if [[ "$f" == *".less" ]]; then
		echo "Change detected. Recompiling...";
		lessc $lessfile > $css && echo "`date`: COMPILED";
	    fi
	done
}

start_lesscwatch & npm start
