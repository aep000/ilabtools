#!/usr/bin/env bash

machine='python'
toFlag='false'
recursiveFlag=''
print_usage() {
  printf 'Usage:\n[-m {ilab name}]: ilab you want to copy to and from\n[-t]: Copy to the ilab instead of from\n[-r]: Makes the copy recursive\n'
}



while getopts 'm:tr' flag; do
  case "${flag}" in
    m) machine="${OPTARG}" ;;
    t) toFlag='true' ;;
    r) recursiveFlag='r';;
    *) print_usage
       exit 1 ;;
  esac
done


shift "$((OPTIND-1))"

if [ $# -le 2 ];
then print_usage;
else
	if [ "$toFlag" = 'true' ]; 
	then 
		scp $recursiveFlag $2 aep143@$machine.cs.rutgers.edu:$1;
	else 
		scp $recursiveFlag aep143@$machine.cs.rutgers.edu:$1 $2; 
	fi
fi
