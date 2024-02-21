# DSM 2.0 - Consumption Operator Samples
Sample manifest for DSM 2.0 Consumption Operator. The Consumption Operator allows remote K8s clusters to provision databases via DSM Gateway.

These examples were used to connect a TKGs workload cluster (provisioned by vSphere ith Tanzu) to provision a PostgreSQL database on DSM 2.0.

There are 3 files in this repo:

1. values_override.yaml: This file contains details the following information:
   - infrastructure policy
   - backup location
   - the name of the K8s cluster wishing to consume databases on DSM
   - psp/security information
  
2. dev-team-ns.yaml: This file create a namespace on the TKGs workload cluster with appropriate DSM info to enable a database to be created

3. pg-by-k8s.yaml: This file contains a manifest which provisions a PostgreSQL database on DSM
