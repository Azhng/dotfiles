#!/usr/bin/env bash

bcd()
{
  cd $HOME/src/github.com/$1
}

bclone()
{
  cdDir=$1
  if echo $1 | grep '/' > /dev/null; then
    echo "Cloning from git@github.com:$1.git"
    cdDir=$(cut -d'/' -f2 <<< $1)
    if [ ! -d $HOME/src/github.com/$cdDir ]; then
      git clone git@github.com:$1.git $HOME/src/github.com/$cdDir
    else
      echo "Already cloned, done."
    fi
  else
    echo "Cloning from git@github.com:$(git config user.name)/$1.git"
    if [ ! -d $HOME/src/github.com/$cdDir ]; then
      git clone git@github.com:$(git config user.name)/$1.git $HOME/src/github.com/$1
    else
      echo "Already cloned, done."
    fi
  fi
  bcd $cdDir
}

bopenpr()
{
  if git rev-parse --git-dir &> /dev/null; then
    curBranch=$(git symbolic-ref --short HEAD)
    if [[ $curBranch != "master" ]]; then
      # assuming ssh remote since `bclone` clone from ssh remote by default
      repoName=$(git config --get remote.origin.url | xargs basename | cut -d'.' -f1)
      ownerName=$(git config --get remote.origin.url | cut -d'/' -f1 | cut -d':' -f2)
      xdg-open https://github.com/$ownerName/$repoName/pull/new/$curBranch &> /dev/null
    else
      echo "cannot open PR for master branch"
    fi
  else
    echo "cannot open pr since current directory is not a git repo"
    return 1
  fi
}

brun()
{
  originalDir=$(pwd)
  repoDir=$(pwd)
  while :; do
    if [[ $(pwd) == "/" ]]; then
      echo "not in a bev enabled dir"
      cd $originalDir
      return 1
    fi
    if [[ -f $(pwd)/bev.yml ]]; then
      repoDir=$(pwd)
      break
    else
      cd ..
    fi
  done
  echo "found bev.yml in $repoDir"
  cd $originalDir
  $HOME/.local/bin/brun.rb $repoDir/bev.yml
}

bev()
{
  case $1 in
  cd)
    bcd $2
  ;;
  clone)
    bclone $2
  ;;
  openpr)
    bopenpr $2
  ;;
  run)
    brun $2
  ;;
  *)
    echo "not yet implemented"
    return 1
  ;;
  esac
}