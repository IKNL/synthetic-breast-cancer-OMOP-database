<img src="https://github.com/IKNL/guidelines/blob/master/resources/logos/iknl_nl.png?raw=true" width=200 align="right">

# Synthetic Breast Cancer OMOP Database

IMPORTANT: This repository does not contain the synthetic data. You can request the synthetic dataset from [here (iknl.nl)](https://iknl.nl/en/ncr/synthetic-dataset). Make sure to add `OMOP synthetic dataset` in the description of the request.


## Preliminaries
* Request the synthetic data from [here](https://iknl.nl/en/ncr/synthetic-dataset) and mention `OMOP synthetic dataset` in the form.
* Docker installed
* Clone this repository


# Initial Setup

1. Place the `.csv` file you obtained from iknl inside the `./init/data` folder. There is a `README.txt` in that directory telling you the same.
2. Obtain the necessary SNOMED vocabulary files from [Athena](https://athena.ohdsi.org/), see the `README.txt` in the `./init/vocab` folder for more information.
3. Verify that the name of your `.csv` file is identical to the name in the `docker-compose.yaml` file. If not, change it to the correct name.
4. Navigate to the directory containing the `docker-compose.yaml` file.
5. Run `docker compose up` (or `docker compose up -d` to detach the process from your terminal).
6. Wait for a long time until you see `database system is ready to accept connections`.
7. Now you have a working OMOP database.

Note: in case you want to have multiple databases running on your machine you can uncomment the `db2` section in the `docker-compose.yaml` file and change the `csv` path `/data/alternative.csv` to the correct path. In this case pgadmin is only connected to the first instance. You can manually add this instance to the pgadmin by logging in to the pgadmin interface and adding a new server with the credentials given in the `docker-compose.yaml` file.

# Life Cycle

1. You can stop the database at any time using `docker compose down` or CRTL+C in case you did not use the `-d` flag when you started the database.

    <aside>
    ✅ Changes are persistent

    The database is persistently stored on your machine in the `pgadmin-data` and the `postgres-data`. So any changes you made in a session are kept.
    </aside>

2. You can start the database any time again using the `docker compose up -d` command.
3. In case you want to start fresh:
    1. Stop the database: `docker compose down`
    2. Remove the database files by deleting the `pgadmin-data` and `postgres-data` folders
    3. Remove the containers: `docker compose rm` (when prompted enter yes)

# PGAdmin

In order to explore the database in a visual way the **pgadmin** container is started along with the omop database. If the database is up and running you can access the pgadmin interface through browsing to: [http://127.0.0.1:5050](http://127.0.0.1:5050) and login with the credentials:

- username: `admin@admin.com`
- password: `root`

<aside>
✅ Note that these are the pgadmin credentials and not the credentials used to connect to the database
</aside>

# SQL Connection Details

The container binds the internal `5432` to the [localhost](http://localhost) by default. It is also possible to connect from another Docker container if they are in the same Docker network.

url: `127.0.0.1` from the Docker host or `omop` if you connect from another container that is the same Docker network
port: `5432`
user: `postgres`
password: `password`

Some details to the OMOP CDM:

dbms: `postgresql`
cdm_database: `omopcdm_synthetic`
cdm_schema: `omopcdm_synthetic`
results_schema: `results_synthetic`

# Folder Structure

## `init/*.sql`

All the .sql files in this folder are executed on initialization in numerical order.

1. It first builds the OMOP CDM (creating all schema's, tables) [files: `0xx-*.sql`]
2. then it loads a syntetic dataset [files: `1xx-*.sql`]
3. it loads the synthetic dataset into the OMOP CDM [files: `2xx-*.sql`]

## default-server.json

This file makes sure the pgadmin already has the omop database server attached.

## pgadmin-data & postgres-data[1,2]

Mount for the pgadmin-data container. This allows for persistent storage even when
the container is stopped. Deleting these folders will remove all settings and data
from the containers.

## docker-compose

container configuration file for the postgres and pgadmin instance

