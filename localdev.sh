#!/bin/bash

BACKSTAGE=${ASSEMBLE_BACKSTAGE:-../assemble-backstage}
ENGINE=${COMPOSE_ENGINE:-docker}
export CONTAINER_UID=${UID:-1000}

## These bind mount options improve performance for applications running
## inside of the container and accessing external files/directories
## Also, `:Z` makes everything work correctly with SELinux
export CONTAINER_VOLUME_OPTIONS=":Z,delegated"


## Detect which Host OS this is running on (If OSTYPE does not exist, we're likely on Windows)
export HOST_OS=${OSTYPE:-windows_nt}

## OS Customizations Via Environment Variables
if [[ "${HOST_OS}" = linux* ]]; then
    ## Linux host, or it should be!
    printf "Detected LINUX host:\n"
fi

if [[ "${HOST_OS}" = windows*  ]]; then
    ## Windows, we believe...
    printf "Detected WINDOWS host:\n"
fi

if [[ "${HOST_OS}" = darwin* ]]; then
    ## MacOS, or something is VERY weird...
    printf "Detected DARWIN/MacOS host:\n"
fi

## Attempt to detect which container engine we should be using.
## By default, if docker is present it will be preferred
export EXTRA_COMPOSE_OPTIONS="-d --remove-orphans"
which docker-compose >> /dev/null
if [ $? -ne 0 ]; then
    which podman-compose >> /dev/null
    if [ $? -ne 0 ]; then
        printf "Docker/Podman Compose is not currently installed or is not in your PATH. Go HERE to install docker compose: https://docs.docker.com/compose/install/ or here for podman compose: https://github.com/containers/podman-compose\n\n"
    else
        ENGINE=podman
        export EXTRA_COMPOSE_OPTIONS=""
        printf "Using Podman\n"
    fi
fi

printf "This script expects that you have the assemble-backstage repo checked out locally in the directory\n"
printf "just above this directory.\n\n"
printf "You can override the location where these source repositories are located using the following environment variables:\n"
printf "      ASSEMBLE_BACKSTAGE\n"
printf "\n"

if [ -e "${BACKSTAGE}" ]; then

    ## Determine if we are using docker-compose or podman-compose
    if [ "${ENGINE}" = "podman" ]; then
        export CONTAINER_UID=0

        ## Podman does not support the `delegated` bind mount option
        ## so it gets removed here
        export CONTAINER_VOLUME_OPTIONS=":Z"
    fi

    ## Execute the appropriate compose command for the current system
    "${ENGINE}-compose" up ${EXTRA_COMPOSE_OPTIONS}
fi

printf "In a few minutes, the following services will be available:\n"
printf "\thttp://localhost:9000/ - PGAdmin\n"
printf "\thttp://localhost:3000/ - Backstage without OAuth Proxy\n"
printf "\thttp://localhost:8080/ - KeyCloak with admin:admin and some example users\n"
printf "\thttp://keycloak:4180/ - Backstage with OAuth Proxy\n"
