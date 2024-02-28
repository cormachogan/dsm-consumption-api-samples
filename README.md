# DSM 2.0 - Consumption Operator Samples
Sample manifest for DSM 2.0 Consumption Operator. The Consumption Operator allows remote K8s clusters to provision databases via DSM Gateway.

See the following blog post for details on how to use the Consumption Operator and these files:
- https://cormachogan.com/2024/02/22/data-services-manager-2-0-part-10-consumption-operator/

These examples were used to connect a TKGs workload cluster (provisioned by vSphere with Tanzu) to provision a PostgreSQL database on DSM 2.0.

There are 3 files in this repo:

1. values_override.yaml: This file contains details the following information:
   - infrastructure policy
   - backup location
   - the name of the K8s cluster wishing to consume databases on DSM
   - psp/security information
  
2. dev-team-ns.yaml: This file create a namespace on the TKGs workload cluster with appropriate DSM info to enable a database to be created

3. pg-by-k8s.yaml: This file contains a manifest which provisions a PostgreSQL database on DSM with dev team bindings

4. mysql-by-k8s.yaml: This file contains a manifest which provisions a MySQL database on DSM with dev team bindings

5. get-connection-string.sh: Returns the psql connection string to connect to the provisioned PostgreSQL database
