#!/bin/bash

setup_git() {
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"
  git config --global github.token ${GH_TOKEN}
}

commit_files() {
    git checkout -qf master
    ls *
    wget -O WI-Strain-Info.tsv https://docs.google.com/spreadsheets/d/1V6YHzblaDph01sFDI8YK_fP0H7sVebHQTXypGdiQIjI/export?format=tsv&id=1V6YHzblaDph01sFDI8YK_fP0H7sVebHQTXypGdiQIjI&gid=0
    ls *
    pwd
    ls -lah
    git add . WI-Strain-Info.tsv
    git remote add origin https://${GH_TOKEN}@github.com/WI-Strain-Info/resources.git > /dev/null 2>&1
    git commit --message "Travis build: ${TRAVIS_BUILD_NUMBER}"
    if [[ $? -eq 0 ]]; then
        git push --set-upstream origin master
    fi;
}

setup_git
commit_files
