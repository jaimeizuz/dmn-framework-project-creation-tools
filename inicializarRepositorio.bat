@echo off

:: Fetch param1
set "azureUser=%~1"
set "azureOrg=%~2"
set "azureProject=%~3"
set "groupId=%~4"
set "artifactId=%~5-decision-services"

call mvn archetype:generate "-DarchetypeGroupId=com.bsc.dmn.architecture" "-DarchetypeArtifactId=dmn-framework-project-archetype" "-DarchetypeVersion=1.0.0-SNAPSHOT" "-DgroupId=%groupId%" "-DartifactId=%artifactId%" "-DinteractiveMode=false"

echo "Creating git repository"

call git init %artifactId% -b main
call git -C %artifactId% remote add origin https://%azureUser%@dev.azure.com/%azureOrg%/%azureProject%/_git/%artifactId%
call git -C %artifactId% add -A
call git -C %artifactId% commit -m "Repository creation"
call git -C %artifactId% push origin main
echo "Git repository created"