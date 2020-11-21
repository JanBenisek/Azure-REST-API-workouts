#!/bin/bash

# run me as ./azure-deploy.sh in a bash shell
printf -v date '%(%Y-%m-%d %H:%M:%S)T\n' -1
echo "Deploying web app ... $date"

export resourceGroup="grp-restapi"
export planName="plan-restapi-workout"
export appName="workout-webapp"
export location="WestUS2"
export gitSource="https://github.com/JanBenisek/Azure-REST-API-workouts.git"
export FLASK_ENV="development"


echo "Creating Application Service Plan...";
az appservice plan create \
    --name $planName \
    --resource-group $resourceGroup \
    --sku F1 \
    --is-linux

echo "Creating Web Application...";
az webapp create \
    -g $resourceGroup \
    -n $appName \
    --plan $planName \
    --runtime "PYTHON|3.8" \
    --deployment-source-url $gitSource \
    --deployment-source-branch master

# Get the CosmosDB KEY
export connectionKEY=$(az cosmosdb keys list \
	--type connection-strings \
	--name $accountName \
	--resource-group $resourceGroup \
	--query connectionStrings[0].connectionString \
	--output tsv)

# Get the CosmosDB URL
export connectionURL=$(az cosmosdb show \
    --resource-group $resourceGroup \
    --name $accountName \
    --query documentEndpoint \
    --output tsv)

# Assign the connection string to an App Setting in the Web App
az webapp config appsettings set \
    --name $appName \
    --resource-group myResourceGroup \
    --settings "KEY=$connectionKEY" "URL=$connectionURL"


printf -v date '%(%Y-%m-%d %H:%M:%S)T\n' -1
echo "Finished deployment ... $date"

