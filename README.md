# Assemble Local Dev

This repository contains a `docker-compose.yml` file and all the configs necessary to start Assemble including the required services.

This will start:

#### Database
A PostgreSQL v14.5 instance with 2 databases. One for Assemble and one for Keycloak.

If you need to query the database, PG Admin is available at [http://localhost:9000](http://localhost:9000) using the username: postgres and password: postgres

#### oAuth2/OIDC Provider
Keycloak v19.0.1 is available at [http://localhost:3434](http://localhost:3434) using the username: admin and password: admin

The setup comes with a pre-configured client `Assemble` and 7 different users. One per persona.

- dev
- dev_lead
- manager
- qa
- prod_approver
- prod_deployer
- audit

The password is the username.

#### ~~Assemble~~
- ~~Assemble is available at http://localhost:3000~~
- ~~APIs are available at http://localhost:8080~~

## Requirements

Please make sure that you have the following installed on your machine:

- Git
- Docker or Podman
- Docker Compose or Podman compose

## Getting started

### Get the source code
You need a git client (command line or IDE) to clone the source code:

```
git clone https://github.com/halkyonio/assemble-local-dev.git
```

This will clone the complete source to your local machine.

### How to start Assemble

You can use Docker or Podman.


#### Start Assemble

You can start all the Assemble containers with the following command:

**For Docker Compose**
```shell
docker-compose up -d --remove-orphans
```

**For Podman Compose**
```shell
podman-compose up -d 
```


Depending on your computer it could take several seconds/minutes. Once everything is started, you can access the app at:

#### Stop Assemble

You can stop all the Assemble containers with the following command:

**For Docker Compose**
```shell
docker-compose down
```

**For Podman Compose**
```shell
podman-compose down --remove-orphans
```

## Troubleshooting

### Error 'listen tcp4 0.0.0.0:5432: bind: address already in use'

It means that you already run a local PostgreSQL database on your computer. you can stop the local service with:

**For Ubuntu**
```
sudo service postgresql stop
```

### Various problems when starting docker-compose

If you had this `docker-compose.yml` file running fine previously and now run into issues, run the following commands:

**For Docker Compose**
```shell
docker-compose down --volumes
```

**For Podman Compose**
```shell
podman-compose down --volumes
```

And try again.

