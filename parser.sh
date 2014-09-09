#.shファイルの場所に移動
echo $0
cd `dirname $0`

#cat cache/amespi-5664.html

url=cache/dragonballgt-5580.html

grep "class=\"entry-title" $url | sed -e "s/\t\t<h1 class=\"entry-title\">//g" -e "s/<\/h1>\t\t<div class=\"entry-meta post_meta_box\">//g"

year=`grep "class=\"sep" $url | grep -o "[0-9]*年" | grep -o "[0-9]*"`

echo $year

month=`grep "class=\"sep" $url | grep -o "[0-9]*月" | grep -o "[0-9]*"`

month=`seq -f %02g $month $month`

echo $month

day=`grep "class=\"sep" $url | grep -o "[0-9]*日" | grep -o "[0-9]*"`

day=`seq -f %02g $day $day`

echo $day

time=$year$month$day

echo $time
