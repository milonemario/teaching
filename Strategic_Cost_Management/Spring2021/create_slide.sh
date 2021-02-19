#!/bin/bash

if [ $1 = "noprint" ]; then
	dir=$(dirname $2)
	name=$(basename $2 .md)
	updir=$(echo $dir | perl -pe 's/[a-zA-Z0-9]+/../g')
	cd $dir
	pandoc -s \
		-f markdown+escaped_line_breaks \
		-t revealjs \
		$name.md -o $name.html \
		--css $updir/ucsd.css \
		-V center=false -V revealjs-url=$updir/reveal.js -V theme=simple.css -V navigationMode=linear \
		-V slideNumber="'c/t'" \
		-V transition=convex \
		-H $updir/header.html \
		-H $updir/header-noprint.html \
		-A $updir/footer.html \
		-F pantable
else
	dir=$(dirname $1)
	name=$(basename $1 .md)
	updir=$(echo $dir | perl -pe 's/[a-zA-Z0-9]+/../g')
	cd $dir
	pandoc -s \
		-f markdown+escaped_line_breaks \
		-t revealjs \
		$name.md -o $name.html \
		--css $updir/ucsd.css \
		-V center=false -V revealjs-url=$updir/reveal.js -V theme=simple.css -V navigationMode=linear \
		-V slideNumber="'c/t'" \
		-V transition=convex \
		-H $updir/header.html \
		-A $updir/footer.html \
		-F pantable

fi
