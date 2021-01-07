# !/bin/bash

echo "Start copy process"
git add .
git commit -m $1
# cp -rv docs ../jkaae93.github.io/docs
# cd ../jkaae93.github.io/
# git add .
# git commit -am $1
# cd ../page_dev/
echo "Fnished copy process"

if [ $2=1 ]
then 
	git push origin +master
fi
