# How to update the realm-export.json file

In the event you need to update settings for the Assemble realm, client, add/modify/delete users, here are the steps to execute.

### Download Keycloak

Download the ZIP version at [https://www.keycloak.org/getting-started/getting-started-zip](https://www.keycloak.org/getting-started/getting-started-zip)

And unzip Keycloak on your local machine.

### Start Keycloak locally

**For Mac and Linux**
```shell
bin/kc.sh start-dev
```

You can now access Keycloak locally at [http://localhost:8080](http://localhost:8080)

At the first startup, you will be prompted to create an admin user and password. Then to login as admin.

### Update Keycloak settings/users

Now that you are logged in as an admin, click on the top left corner to create a new Realm. Do not enter anything except selecting the `docker/config/keycloak/realm-export.json` file. This will create the `Assemble` realm to your local Keycloak. 

You can now update anything in the `Assemble` realm. Managing the settings, clients, roles, users, groups, etc.

Once completed, you will need to export the data.

### Export the new settings

Before exporting the new settings, you must stop Keycloak. Otherwise the users will not be exported.
Once Keycloak is stopped locally, you can run the following command to export all the `Assemble` realm settings:

```shell
bin/kc.sh export --realm Assemble --users realm_file --file realm-export.json
```

You can use this export file to replace the `docker/config/keycloak/realm-export.json` file.