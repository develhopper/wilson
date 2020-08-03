#!/bin/bash
function run(){
        #echo $1
        result=$(grep -P "^$1(?=[-\=])" $HOME/.wilsonrc)
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
InColor='\033[1;37m' # Input color
OutColor='\033[0;31m' # Output color
if [ -z $1 ]
then
        while :
        do
			echo -en "${OutColor}Wilson(: ${InColor}"
            read cmd
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
