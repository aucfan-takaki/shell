#!/bin/bash

#.shファイルの場所に移動
echo $0
cd `dirname $0`

#cat cache/amespi-5664.html


list=`ls cache/*.html | sed -e 's/\.html//g' -e 's/cache\///g'`


for filename in $list

do
	judge=`grep -o ${filename} cache/tsv.tsv`

	if [ -e $judge ]; then 
	
	#filename=amespi-5664

	file=cache/$filename.html

	title=`grep "class=\"entry-title" $file | sed -e "s/\t\t<h1 class=\"entry-title\">//g" -e "s/<\/h1>\t\t<div class=\"entry-meta post_meta_box\">//g"`

	year=`grep "class=\"sep" $file | grep -o "[0-9]*年" | grep -o "[0-9]*"`

	month=`grep "class=\"sep" $file | grep -o "[0-9]*月" | grep -o "[0-9]*"`

	day=`grep "class=\"sep" $file | grep -o "[0-9]*日" | grep -o "[0-9]*"`

	time=`printf "%04d%02d%02d" $year $month $day`

	url=http://aucfan.com/article/$filename/

	
	tsvdata="$time	$title	$url"
	IFS=$tsvdata

	IFS=$'\n'

	echo $tsvdata

	echo $tsvdata >> cache/tsv.tsv

		
	fi

done
