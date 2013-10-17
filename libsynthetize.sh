#! /bin/bash
#
# libsynthetize.sh
# Copyright (C) 2013 Xavier Bruhiere


# Synthetize needs ansible and docker to work
function check_dependencies() {
    #TODO Check for ansible installation (and right version)
    #TODO Check for docker installation (and right version)
    #TODO Check for ansible-shell
    echo 0
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

function is_container_built() {
    image=$1
    OUTPUT=$(docker images | grep ${image})

    if [ -z "$OUTPUT" ]; then
        echo 1
    else
        echo 0
    fi
}

function is_container_running() {
    image=$1
    OUTPUT=$(docker ps | grep ${image})

    if [ -z "$OUTPUT" ]; then
        echo 1
    else
        echo 0
    fi
}
