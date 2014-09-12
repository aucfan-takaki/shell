#!/bin/bash

#sudo mysql

#create table okutopi(date int,title text,url text);

#set character_set_results=utf8;
#mysql -uroot -e "use calendar;"

mysql -uroot -e "use calendar; LOAD DATA INFILE '/deploy/shell/cache/tsv.tsv' INTO TABLE okutopi (date,title,url);"

#\\q

