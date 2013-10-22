#! /bin/bash
# encoding: utf-8
#
# Copyright 2013 Xavier Bruhiere

#dpkg --get-selections | grep "^python$"

function log () {
    #TODO Save it in a file as well ?
    if [ "$verbose" == "true" ]; then
        printf "\r\033[00;36m  [ \033[00;34m..\033[00;36m ] $1\033[0m\n"
    fi
}

function success () {
    if [ "$verbose" == "true" ]; then
        printf "\r\033[00;36m  [ \033[00;32mOK\033[00;36m ] $1\033[0m\n"
    fi
}

function fail () {
    if [ "$verbose" == "true" ]; then
        printf "\r\033[00;36m  [\033[00;31mFAIL\033[00;36m] $1\033[0m\n"
        echo ''
    fi
}

function die()
{
    fail "${@}"
    exit 1
}

function is_installed () {
    #dpkg -s "$1" >/dev/null 2>&1
    command -v $1 > /dev/null 
    echo $?
}

function is_python_project() {
    #NOTE Or use requirements.txt like heroku
    [[ -f requirements.txt ]]
    #[[ $(ls -al | grep *.py) != "" ]]
}


function is_ruby_project() {
    [[ -f Gemfile ]]
}


function is_node_project() {
    [[ -f package.json ]]
}
