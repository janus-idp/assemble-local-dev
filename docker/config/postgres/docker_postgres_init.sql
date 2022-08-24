CREATE DATABASE assemble
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1;


CREATE DATABASE keycloak
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1;

-- CREATE USER keycloak WITH PASSWORD 'keycloak'
--
-- GRANT ALL PRIVILEGES ON DATABASE keycloak TO keycloak;