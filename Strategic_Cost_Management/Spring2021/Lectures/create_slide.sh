#!/bin/bash

cd Session$1
pandoc -s \
	-f markdown+escaped_line_breaks \
  -t revealjs \
	Lecture$1.md  -o Lecture$1.html \
	--css ../ucsd.css \
  -V center=false -V revealjs-url=../../reveal.js -V theme=simple.css -V navigationMode=linear \
	-V slideNumber="'c/t'" \
	-V transition=convex \
	-H ../header.html \
	-A ../footer.html \
	-F pantable
