#!/bin/bash
need_container=("tordocker1" "tordocker2" "tordocker3" "tordocker4" "tordocker5")
container_list=( $(docker ps -a --format '{{.Names}}') )

function is_alive() {
    local check_container current_containers
    check_container="${1}"; shift; current_containers=("${@}")

    for compare_container in ${current_containers[@]}; do
        [ "${compare_container}" == "${check_container}" ] && return 0
    done
    return 1
}

function restart_container() {
    for container in ${need_container[@]}; do
        is_alive ${container} ${container_list[@]}
        bool=$?
        if [ ${bool} -ne 0 ]; then
            docker run --rm -d --volumes-from onionlinkset-volume --name ${container} larkjh/tbselcrawler:0.7 python3 /home/tordocker/tbSelenium/tor_pageCrawler_tab.py ${container:9} 120
            echo "${container} start"
        fi
    done
}


if [ ${#container_list[@]} -lt 7 ]; then
    restart_container       
fi
