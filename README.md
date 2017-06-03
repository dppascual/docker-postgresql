# dppascual/postgresql:9.6-01

- [Introduction](#introduction)
- [Getting started](#getting-started)
  - [Installation](#installation)
  - [Quickstart](#quickstart)

# Introduction

`Dockerfile` to create a [Docker](https://www.docker.com/) container image for [PostgreSQL](http://postgresql.org/).

PostgreSQL is an object-relational database management system (ORDBMS) with an emphasis on extensibility and standards-compliance.

# Getting started

## Installation

Automated builds of the image are available on [Dockerhub](https://hub.docker.com/u/dppascual/postgresql) and is the recommended method of installation.

```bash
docker pull dppascual/postgresql:9.6-01
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
  dppascual/postgresql:9.6-01
```

Login to the PostgreSQL server using:

```bash
docker exec -it postgresql sudo -i -u postgres psql
```
