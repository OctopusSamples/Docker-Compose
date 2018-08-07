#!/bin/bash 
 
 cmd="up"
 octopus=0
 project_name="MyApp"
 while getopts ":n:c:o" opt; do
  case $opt in
	o) octopus=1
    ;;
	n) project_name="$OPTARG"
	;;
    c) cmd="$OPTARG"
    ;;
    \?) echo "Invalid option -$OPTARG" >&2
    ;;
  esac
done


if [[ $cmd = "up" ]]; then
	if [[ octopus -eq 1 ]]; then
		mv ./.env ./.env.old
		mv ./octopus.env ./.env
	fi
	docker-compose --project-name $project_name  up -d
else
	docker-compose --project-name $project_name  $cmd
fi

#printf "Argument octopus is %s\n" "$octopus"
#printf "Argument project_name is %s\n" "$project_name"
#printf "Argument cmd is %s\n" "$cmd"