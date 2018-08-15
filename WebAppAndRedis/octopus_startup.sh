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
		echo "Replacing '.env' file with '.octopus.env'"
		mv ./.env ./.env.old
		mv ./octopus.env ./.env
	fi
	#docker-compose pushes non errors onto stderr. Redirect to stdout
	docker-compose --project-name $project_name  up -d  2>&1
else
	docker-compose --project-name $project_name  $cmd  2>&1
fi