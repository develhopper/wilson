#!/bin/bash
function run(){
		result=$(grep -P "^$1\s?(\{\}|$2)?(?=[-\=])" $HOME/.wilsonrc)
		echo $result
        if [ -z "$result" ]
        then
            echo "command not found"
            return
        fi
		count=$(echo $result | awk -F"->" '{print NF-1}')
		if [[ $count -ge 2 ]];then
				echo -en "Error: ${OutColor}config file syntax is incorrect - duplicate commands\n"
				return
		fi

		cmd=$(echo "$result"|grep -oP '(?<=\>).*');
		if [[ $cmd == *"{}"* ]];then
			if [[ -z $2 ]];then
				echo "Invalid parameters"
				return
			fi
			cmd=$(echo "$cmd" | sed "s/{}/$2/g")
		fi
		echo $cmd
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
			params=($cmd)
            run ${params[@]}
        done
else
        run $@
fi
