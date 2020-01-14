#!/bin/bash
function run(){
        echo $1
        result=$(grep -P "^$1(?=-)" $HOME/.wilsonrc)
        if [ -z "$result" ]
        then
            echo "command not found"
            return
        fi
        cmd=$(echo "$result"|grep -oP '(?<=\>).*');
        echo -e "starting ..."
        eval $cmd
        echo
}
echo -e "\033[1;31m"
if [ -z $1 ]
then
        while :
        do
            read -p "Wilson(: " cmd
            if [[ "$cmd" == "exit" ]]; then
                    break
            fi
            run "$cmd"
        done
else
        param=$1
        if ! [ -z $2 ]; then
            param="$1 $2"
        fi
        run "$param"
fi
