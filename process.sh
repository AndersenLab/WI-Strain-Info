#!/bin/sh

setup_git() {
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"
  git config --global github.token ${GH_TOKEN}
}

commit_files() {
    curl https://docs.google.com/spreadsheets/d/1V6YHzblaDph01sFDI8YK_fP0H7sVebHQTXypGdiQIjI/export?format=tsv&id=1V6YHzblaDph01sFDI8YK_fP0H7sVebHQTXypGdiQIjI&gid=0 > WI-Strain-Info.tsv
    git add WI-Strain-Info.tsv
    git commit --message "Travis build: ${TRAVIS_BUILD_NUMBER}"
    if [[ $? -eq 0 ]]; then
        git push --quiet
    fi;
}

setup_git
commit_files
