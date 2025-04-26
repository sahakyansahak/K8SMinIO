# Automated PostgreSQL Backup to S3-Compatible Storage

## Overview

This project automates the provisioning of a PostgreSQL database cluster and an S3-compatible object storage cluster across two Kubernetes clusters. The solution includes a scheduled backup mechanism where PostgreSQL database dumps are securely uploaded to an S3-compatible storage daily.

This infrastructure setup is fully automated and designed to work seamlessly on local Kubernetes clusters, while also being repeatable for different environments.

## Architecture

- **PostgreSQL Database Cluster**: Deployed using Helm.
- **S3-Compatible Object Storage**: Deployed on a separate Kubernetes cluster (e.g., Minio).
- **Automated Backup**: A CronJob on the PostgreSQL cluster dumps the database daily and uploads the backup to the object storage.

## Prerequisites

1. Two Kubernetes clusters (one for PostgreSQL, one for object storage).
2. Kubernetes kubeconfig files for both clusters.
3. Terraform and Helm for provisioning resources.
4. PostgreSQL backup script to dump and upload the database.
5. Minio or another S3-compatible storage.
