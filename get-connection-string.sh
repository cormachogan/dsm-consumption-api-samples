#!/bin/bash
#
########################################################################
#
# Script to generate connection string to a postgreSQL database
# which has been deployed by the VMware Data Services Manager
# Consumption Operator from a remote Kubernetes Cluster
#
# Author: CJH
# Date: 22-Feb-2024
# Version: 0.1
#
########################################################################

echo
echo "This script will create a psql connection string to a Postgres"
echo "database that has been provisioned using VMware Data Services"
echo "Manager using the DSM Consumption Operator"
echo
echo "Ensure that the CONTEXT has been set to the correct Kubernetes "
echo "custer where the DSM Consumption Operator has been deployed."
echo
read -p "Enter the name of the PostgreSQL cluster that you wish to connect to: " pgdb
read -p "Enter the namespace of the PostgreSQL cluster that you wish to connect to: " ns

host=`kubectl get postgresclusters ${pgdb} -n ${ns} --template={{.status.connection.host}}`
dbname=`kubectl get postgresclusters ${pgdb} -n ${ns} --template={{.status.connection.dbname}}`
port=`kubectl get postgresclusters ${pgdb} -n ${ns} --template={{.status.connection.port}}`
user=`kubectl get postgresclusters ${pgdb} -n ${ns} --template={{.status.connection.username}}`
passwd=`kubectl get secrets ${pgdb} -n ${ns}  --template={{.data.password}} | base64 --decode`

echo
echo "Connection string for database ${pgdb} :"
echo
echo "postgres://${user}:${passwd}@${host}:${port}/${dbname}"
echo
echo
