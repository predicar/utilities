#!/bin/bash


function update_dir() {
	git checkout dev
	git pull
	#for i in `git branch -a | grep remote | grep -v HEAD | grep -v master`; do git branch --track ${i#remotes/origin/} $i; done
	prune=$(git remote prune origin)
	echo $prune | grep -o "origin/.*$" | grep -o "feature/.*$" | xargs git branch -d
	cd ..
}


SCRIPT_DIR=$(pwd)
cd predicar_manager
update_dir
cd predicar_crawler
update_dir
cd predicar_textProcessor
update_dir
cd predicar_predictor
update_dir


