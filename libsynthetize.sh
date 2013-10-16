#! /bin/bash
#
# libsynthetize.sh
# Copyright (C) 2013 Xavier Bruhiere
#
# Distributed under terms of the MIT license.
#

# Synthetize needs ansible and docker to work
function check_dependencies() {
    #TODO Check for ansible installation (and right version)
    #TODO Check for docker installation (and right version)
    #TODO Check for ansible-shell
    echo 0
}

function is_installed() { 
    command -v $1 > /dev/null 
}

function play_playbook() {
    #ansible-playbook ${playbook} --check --diff --ask-sudo-pass \
    ansible-playbook ${playbook} --ask-sudo-pass ${check} \
        -u ${user} -i ${INVENTORY} -f $PARALLEL_LEVEL --verbose \
        --extra-vars "data=${DATA} hosts=${target_hosts} home=${TARGET_HOME} dna_root=${DNA_ROOT}"
}

function build_prototype_image() {
    test -f Dockerfile || exit 1
    docker build -rm -t ${image} - < $dockerfile
}

function is_built() {
    image=$1
    OUTPUT=$(docker images | grep ${image})

    if [ -z "$OUTPUT" ]; then
        echo 1
    else
        echo 0
    fi
}

function is_running() {
    image=$1
    OUTPUT=$(docker ps | grep ${image})

    if [ -z "$OUTPUT" ]; then
        echo 1
    else
        echo 0
    fi
}

function log () {
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
