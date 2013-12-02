#!/bin/bash

usage()
{
    echo "ghist2db -- convert Android git history to sqlite db."
    echo "Usage:"
    echo "repo forall -c ghist2db.sh"
    echo "or, run it separately for each repo project"
}

find_repo_top()
{
    cwd=$1
    while [ "$cwd" != "" -a "$cwd" != "~" ]; do
       if [ -f $cwd/.repo/repo/main.py ]; then 
           repo_top=$cwd
           return
       fi
       cwd=${cwd%\/*}
   done
}

if [ "$repo_top"=="" ]; then
  #echo "repo_top is empty, need to call find_repo_top"
  find_repo_top `pwd`
fi

if [ "$repo_top" == "" ]; then
    echo "seems you're not in a Android repo, please cd to Android repo!"
    usage; exit 1
fi
repo_name=${repo_top##*\/}
#echo "repo_top: " $repo_top
#echo "repo_name: " $repo_name

proj=`pwd | awk -F"$repo_name"/ '{print $2}'`

echo "populating git info in $proj..."

# step 1: print git history logs in with "--pretty" format option, so that it's ready as sql sentences.
git log --pretty=format:"insert into googler_info (h, ae, ce, at, proj) values ('%h', '%ae', '%ce', '%at', '$proj');" --author=@google.com > googler_info.txt

# step 2: group all insert operations into one commit.
echo -e "begin;\n$(cat googler_info.txt)\ncommit;" > final_googler_info.sql

# step 3: add lines for creating table.
echo -e "create table if not exists googler_info(
     _id             integer primary key autoincrement,
     h               text not null,
     ae               text not null,
     ce               text not null,
     at               text not null,
     proj             text not null);
\n$(cat final_googler_info.sql)" > final_googler_info.sql

# step 4: create the db file
echo "inserting to db..."
sqlite3 "$repo_top"/ginfo.db < final_googler_info.sql
echo "done."
