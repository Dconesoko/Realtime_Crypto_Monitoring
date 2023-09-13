
# Description

This project provides an implementation of a near-real-time dashboard that provides a snapshot
of the current pricing<br> and market activities of some selected cryptocurrencies from [Coinbase's](https://docs.coincap.io/) API.
The payload from the source API is written "as-is" to Postgres hosted in a Kubernetes Cluster. A scheduled pipeline is used to ingest and transform the raw data and write them to a sink in Bigquery.

## Objectives
- Provide a near real-time market report of the crypto market movement
- Document and present the implementation

## Requirements
- Provisioned a Kubernetes cluster
- 

## ARCHITECTURE

<img src="https://github.com/Dconesoko/Data_engineering/blob/dev/pipe_infra/pics/readme_pipeline.jpeg" width="700">

## SETUP

- Docker & Docker compose
- Git & GitHub
- Pgadmin
- Tableau



