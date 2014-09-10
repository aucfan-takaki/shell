#.shファイルの場所に移動
echo $0
cd `dirname $0`

#cat cache/amespi-5664.html

url=cache/nishikori-5684.html

grep "class=\"entry-title" $url | sed -e "s/\t\t<h1 class=\"entry-title\">//g" -e "s/<\/h1>\t\t<div class=\"entry-meta post_meta_box\">//g"

year=`grep "class=\"sep" $url | grep -o "[0-9]*年" | grep -o "[0-9]*"`

month=`grep "class=\"sep" $url | grep -o "[0-9]*月" | grep -o "[0-9]*"`

day=`grep "class=\"sep" $url | grep -o "[0-9]*日" | grep -o "[0-9]*"`

time=`printf "%04d%02d%02d" $year $month $day`

echo $time
