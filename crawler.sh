#.shファイルの場所に移動
echo $0
cd `dirname $0`

#cacheファイルがなかったら作成
if ! [ -e cache ]; then
	mkdir cache
fi

#トップページをクロール
curl -o cache/okutopi.html http://aucfan.com/article/

#オクトピのページ数を取得
pagenum=`grep "page-number num" cache/okutopi.html|tail -n 1|sed -e "s/\t<li><a class='page-number num' href='http:\/\/aucfan.com\/article\/?paged=//g" -e "s/'>\([2-9]*\)<\/a><\/li>//g"`


for i in `seq 1 $pagenum`
do

	curl -o cache/okutopi${i}.html http://aucfan.com/article/?paged\=${i}

	#オクトピの記事毎のurlをclassで識別し、hrefなどいらない部分を消してURL取得
	urls=`grep "box_link" cache/okutopi${i}.html | sed -e "s/\t<a href=\"//g" -e "s/\" class=\"box_link\">//g"`
	
	for url in $urls
	do
		name=`echo $url | sed -e "s/http:\/\/aucfan.com\/article\///g" -e "s/\///g"`
		#echo $name
		
		if [ -e cache/${name}.html ]; then
			echo "cacheあり:"$name
		else
			curl $url > "cache/${name}.html"
		fi
	done

done





#echo ${array[@]}

# for count in 0 1
# do
# 	${urls[$count]} > "${names[$count]}.html"
#done
