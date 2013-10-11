#! /bin/bash
#
# prototype.sh
# Copyright (C) 2013 xavier <xavier@laptop-300E5A>
#
# Distributed under terms of the MIT license.
#

# const (
    IMAGE_NAME=hivetech/prototype

    SSH_PORT=49500

    ANSIBLE_PATH=provision/ansible
    PLAYBOOK=${ANSIBLE_PATH}/site.yml
    INVENTORY=${ANSIBLE_PATH}/hosts
    DATA=data.yml
    USER=root
# )

function test_playbook() {
    ansible-playbook ${PLAYBOOK} \
        --verbose -u ${USER} -i ${INVENTORY} \
        --extra-vars "data=${DATA} user=${USER} hosts=prototype home=/root"
}

function build_prototype_image() {
    test -f Dockerfile || exit 1
    docker build -t ${IMAGE_NAME} .
}

function is_built() {
    OUTPUT=$(docker images | grep ${IMAGE_NAME})

    if [ -z "$OUTPUT" ]; then
        echo 1
    else
        echo 0
    fi
}

function is_running() {
    OUTPUT=$(docker ps | grep ${IMAGE_NAME})

    if [ -z "$OUTPUT" ]; then
        echo 1
    else
        echo 0
    fi
}

function main() {
    COMMAND=$1
    if [ "$COMMAND" == "interactive" ]; then
        if [[ $(is_running) -eq 0 ]]; then
            echo "Found $IMAGE_NAME running, initiating interactive mode"
            echo "Use 'cd ansible' once connected to interact with your running prototype"
            ansible-shell
        else
            echo "No $IMAGE_NAME running, build it if necessary and run it and restart"
        fi
    elif [ "$COMMAND" == "build" ]; then
        build_prototype_image
    else
        if [[ $(is_built) -eq 0 ]]; then
            echo "Found $IMAGE_NAME docker image, moving on"
        else
            echo "No $IMAGE_NAME found locally, building it..."
            build_prototype_image
        fi

        if [[ $(is_running) -eq 0 ]]; then
            echo "Found $IMAGE_NAME running, moving on"
        else
            echo "No $IMAGE_NAME running, starting it"
            docker run -d -p $SSH_PORT:22 $IMAGE_NAME
        fi

        echo "Testing prototype"
        test_playbook
    fi
}

main $1
