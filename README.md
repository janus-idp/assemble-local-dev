# Assemble Local Dev

This repository contains a `docker-compose.yml` file and all the configs necessary to start Assemble including the required services.

This will start:

#### Database
A PostgreSQL v14.5 instance with 2 databases. One for Assemble and one for Keycloak.

If you need to query the database, PG Admin is available at [http://localhost:9000](http://localhost:9000) using the username: postgres and password: postgres

#### oAuth2/OIDC Provider
Keycloak v19.0.1 is available at [http://localhost:8080](http://localhost:8080) using the username: admin and password: admin

The setup comes with a pre-configured client `Assemble` and 7 different users. One per persona.

- dev
- dev_lead
- manager
- qa
- prod_approver
- prod_deployer
- audit

The password is the username.

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

git clone https://github.com/halkyonio/assemble-backstage.git
```

Both the `assemble-local-dev` and the `assemble-backstage` repos should be cloned into the same folder and be located right next to each other.  For example:
```
~/assemble/assemble-backstage
~/assemble/assemble-local-dev
```

If they aren't you can set an environment variable `ASSEMBLE_BACKSTAGE` to the location of the `assemble-backstage` folder.

### How to start Assemble

You can use Docker or Podman.


#### Add /etc/hosts entry
Add an entry to /etc/hosts pointing keycloak to 127.0.0.1
```
127.0.0.1       localhost keycloak ## KEYCLOAK ENTRY HERE
```

#### Add oauth2Proxy as a provider
In the `app-config.yaml` file of the `assemble-backstage` folder, update the auth configuration to include oauth2Proxy as a provider.
```
auth:
  providers:
    oauth2Proxy: {}
```

#### Start Assemble
You can start all the Assemble containers with the following command:

```shell
./localdev.sh
```

This should be able to detect if you are using Podman or Docker.  If it doesn't for some reason you can set an environment variable of `COMPOSE_ENGINE` to `docker` or `podman`


Depending on your computer it could take several seconds/minutes. Once everything is started, you can access the app at:

http://keycloak:4180

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

### OAuth2-Proxy is not starting with podman
podman-compose will copy the local `/etc/hosts` file into the container.  If you add the `keycloak` entry to localhost it will interfere with the container alias.  Thus you need to remove the `keycloak` alias from the local `/etc/host` file until after the container starts.  Once it start you can add it back.

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

