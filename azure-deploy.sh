#!/bin/bash

# run me as ./azure-deploy.sh in a bash shell
printf -v date '%(%Y-%m-%d %H:%M:%S)T\n' -1
echo "Deploying web app ... $date"

export resourceGroup="grp-restapi"
export planName="plan-restapi-workout"

az appservice plan create \
    --name $planName
    --resource-group $resourceGroup
    --sku F1

az webapp create \
    --name workout-webapp
    --plan $planName
    --runtime "Python|3.8"
    --resource-group $resourceGroup


printf -v date '%(%Y-%m-%d %H:%M:%S)T\n' -1
echo "Finished deployment ... $date"

