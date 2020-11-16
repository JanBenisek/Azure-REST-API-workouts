#!/bin/bash

printf -v date '%(%Y-%m-%d %H:%M:%S)T\n' -1
echo "Starts building resources ... $date"

export resourceGroup="grp-restapi"
export location="westeurope"

export appName="App-workout-logger"
export accountName="appworkout"
export dbName="workoutdb"


echo "Creating Resource Group...";
az group create \
    -n $resourceGroup \
    -l $location

echo "Creating Cosmos DB account...";
az cosmosdb create \
    --name $accountName \
    --kind GlobalDocumentDB \
    --resource-group $resourceGroup

echo "Creating Cosmos DB database...";
az cosmosdb sql database create \
    --account-name $accountName \
    --name $dbName \
    --resource-group $resourceGroup

echo "Creating Cosmos DB container Gym...";
az cosmosdb sql container create \
    --account-name $accountName \
    --database-name $dbName \
    --name "WorkoutSessions" \
    --partition-key-path "/'\$v'/sessionID/'\$v'" \
    --throughput 400 \
    --resource-group $resourceGroup

echo "Show account URL ...";
az cosmosdb show \
    --resource-group $resourceGroup \
    --name $accountName \
    --query documentEndpoint \
    --output tsv

echo "Show account key ...";
az cosmosdb keys list \
    --resource-group $resourceGroup \
    --name $accountName \
    --query primaryMasterKey \
    --output tsv

printf -v date '%(%Y-%m-%d %H:%M:%S)T\n' -1
echo "Finished building resources ... $date"

