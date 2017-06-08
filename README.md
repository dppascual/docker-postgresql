# dppascual/postgresql:9.6-02

- [Introduction](#introduction)
- [Getting started](#getting-started)
  - [Installation](#installation)
  - [Quickstart](#quickstart)
  - [Creating database user](#creating-database-user)
  - [Creating databases and granting user access to a database](#creating-databases-and-granting-user-access-to-a-database)

# Introduction

`Dockerfile` to create a [Docker](https://www.docker.com/) container image for [PostgreSQL](http://postgresql.org/).

PostgreSQL is an object-relational database management system (ORDBMS) with an emphasis on extensibility and standards-compliance.

# Getting started

## Installation

Automated builds of the image are available on [Dockerhub](https://hub.docker.com/u/dppascual/postgresql) and is the recommended method of installation.

```bash
docker pull dppascual/postgresql:9.6-02
```

Alternatively you can build the image yourself.

```bash
docker build -t dppascual/postgresql github.com/dppascual/docker-postgresql
```

## Quickstart

Start PostgreSQL using:

```bash
docker run --name postgresql -d --restart always \
  -p 5432:5432 \
  dppascual/postgresql:9.6-02
```

Login to the PostgreSQL server using:

```bash
docker exec -it postgresql su - postgres -c psql
```

## Creating database user

A new PostgreSQL database user can be created by specifying the `DB_USER` variable while starting the container. In this variable, you should specify the database user and password separated by colons. Additionally, more than one database user can be created by specifying a comma separated list of database users.

```bash
docker run --name postgresql -d --restart always \
  --env 'DB_USER=dbuser1:dbpass1,dbuser2:dbpass2,dbuser3:dbpass3' \
  dppascual/postgresql:9.6-02
```

> **Notes**
>
> - No changes will be made if the user already exists
> - Several users can be created at each launch

## Creating databases and granting user access to a database

A new PostgreSQL database can be created by specifying the `DB_NAME` variable while starting the container. In this variable, you should specify the database that you want to create and the database user that will be granted access to the database.

Additionally, more than one database can be created by specifying a comma separated list of database names in `DB_NAME`.

```bash
docker run --name postgresql -d --restart always \
  --env 'DB_NAME=dbuser1:dbname1,dbuser2:dbname2,dbuser3:dbname3' \
  dppascual/postgresql:9.6-02
```
