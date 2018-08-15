 Param(
   [string]$ProjectName="MyApp",
   [string]$UseOctopusEnv = $false,
   [Parameter(Position=0)]
   [ValidateSet("up","down", "kill")] 
   [string]$command = "up"
)

if($command -eq "up") {
	if($UseOctopusEnv -eq $true) {
		Write-Host "Replacing '.env' file with 'octopus.env'"
		mv .\.env .\.env.old
		mv .\octopus.env .\.env
	}
	. docker-compose --project-name $ProjectName  up -d
} else {
	. docker-compose --project-name $ProjectName  $command
}