#!/usr/bin/env bash

MESSAGE=$(git log --format=%B -n 1 $TRAVIS_COMMIT)
mkdir getJenkinsFile
cd getJenkinsFile
git clone https://github.com/RedHatInsights/insights-advisor-frontend-build.git
cd insights-advisor-frontend-build
cp Jenkinsfile ../../dist/Jenkinsfile
cd ../../dist
git init
git config --global user.name $COMMIT_AUTHOR_USERNAME
git config --global user.email $COMMIT_AUTHOR_EMAIL
git remote add travis-build ${REPO}.git
git fetch origin
git branch -v -a
git checkout -b stable
git add .
git commit -m 'Build Stable by Travis'
git push --force --set-upstream travis-build stable:stable
