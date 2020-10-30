#!/bin/bash

# Mostly cgit sites
#declare -a full=(git.gpcf.eu git.bananach.space git.linux-forks.de notabug.org cheapiesystems.com repo.or.cz)
declare -a shallow=(github.com gitlab.com bitbucket.com)
lineno=0
while read; do
    if [[ ${REPLY:0:1} == '[' ]]; then
        submodule=$(echo $REPLY  | sed -E 's,\[submodule \"(.+)\"\],\1,g')
        unset -v path
        unset -v url
    elif [[ ${REPLY:1:4} = 'path' ]]; then
        path=${REPLY/* = /};
    elif [[ ${REPLY:1:3} = 'url' ]]; then
        url=${REPLY/* = /};
    fi
    if [[ -v submodule && -v path && -v url ]]; then
        echo "Should checkout: $submodule into $path from $url"
        for domain in ${shallow[@]}; do
            if [[ $url == *${domain}* ]] ; then
                echo "Shallow cloning..."
                git submodule update --init --depth 1 $submodule
                continue 2
            fi
        done
        echo "Full cloning..."
        git submodule update --init $submodule
    fi
done < .gitmodules




#while read; do echo ${REPLY/\[submodule *\]/}; replies+=(${REPLY/\[submodule *\]/}); done < .gitmodules
