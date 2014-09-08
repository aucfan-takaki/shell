#if分岐でデータ保持しているかを作る
#curl -o okutopi.html http://aucfan.com/article/

urls=`grep "box_link" okutopi.html | sed -e "s/\t<a href=\"//g" -e "s/\" class=\"box_link\">//g"`

names=`grep "box_link" okutopi.html | sed -e "s/\t<a href=\"http:\/\/aucfan.com\/article\///g" -e "s/\/\" class=\"box_link\">//g"`

for url in $urls
do
	name=`echo $url | sed -e "s/http:\/\/aucfan.com\/article\///g" -e "s/\///g"`
	echo $name
	curl $url > "${name}.html"

	#array[$count]=$url
done


#echo ${array[@]}

# for count in 0 1
# do
# 	${urls[$count]} > "${names[$count]}.html"
# done