# Workout logger - Azure REST API

Simple REST API which lets you log your workout sessions built on Azure Cosmos DB.
On top, we deploy it by using Azure pipelines.

### How to build infrastructure:
  - Just run the `resources/azure-resources.sh` file
  - It also produces `key` and `url` used for connection
  - For now, the data are manually updated to the container

## Deploy the API
  - Build the webapp by running `resources/azure-deploy.sh` file
  - As an experiment, I set up Azure Pipelines
  - -  It will be triggered upon commit, deploying the newest version

### Usage
  - See the `resources/examples.ipynb` file

### Useful resources:
  - https://cloudskills.io/blog/azure-devops-pipeline
  - https://docs.microsoft.com/en-us/azure/devops/pipelines/ecosystems/python-webapp?view=azure-devops
  - https://programminghistorian.org/en/lessons/creating-apis-with-python-and-flask
  - https://www.codementor.io/@sagaragarwal94/building-a-basic-restful-api-in-python-58k02xsiq
  - https://flask-restful.readthedocs.io/en/latest/quickstart.html#full-example
  - https://docs.microsoft.com/en-us/samples/azure-samples/azure-sql-db-python-rest-api/azure-sql-db-python-rest-api/
  - https://github.com/Azure-Samples/azure-sql-db-python-rest-api
  - https://github.com/Azure/azure-sdk-for-python/blob/master/sdk/cosmos/azure-cosmos/samples/examples.py
  - https://docs.microsoft.com/en-us/azure/devops/pipelines/ecosystems/python-webapp?view=azure-devops
