#! /bin/bash

# GIT functions for better prompt

function git-find-branch {
  if [[ $head == ref:\ refs/heads/* ]]; then
    git_branch=" ${head#*/*/}"
  elif [[ $head != '' ]]; then
    git_branch=" ${head:0:6}"
  else
    git_branch=' (unknown)'
  fi
}

function git-find-head-file {
  local dir=$(pwd)
  local head=''
  local submod=''
  until [ "$dir" -ef / ]; do
  if [ -f "$dir/.git" ]; then
    submod=`basename $dir`
    git_at="@"
    git_repo="${submod}"
    until [ "$dir" -ef / ]; do
      if [ -f "$dir/.git/modules/$submod/HEAD" ]; then
        head=$(< "$dir/.git/modules/$submod/HEAD")
        git-find-branch
        return
      fi
      dir=`dirname $dir`
    done
  elif [ -f "$dir/.git/HEAD" ]; then
    git_at="@"
    git_repo="`basename $dir`"
    head=$(< "$dir/.git/HEAD")
    git-find-branch
    return
  fi
    dir=`dirname $dir`
  done
  git_branch=''
  git_at=''
  git_repo=''
}

# definition of bash prompt
export GIT_PROMPT="\[\e[0m\][\[\e[0;32m\]\u\[\e[0m\]@\[\e[0;33m\]\h\[\e[0;35m\]\$git_branch \[\e[0m\]\w]$\[\e[0m\] "
