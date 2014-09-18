#!/bin/bash

#sudo mysql

#create table okutopi(date int,title text,url text);

#show variables like "char%";
#set character_set_results=utf8;
#mysql -uroot -e "use calendar;"

mysql -uroot -e "use calendar; set character_set_results=utf8; LOAD DATA LOCAL INFILE '/deploy/shell/cache/tsv.tsv' INTO TABLE okutopi (date,title,url);"

#\\q

