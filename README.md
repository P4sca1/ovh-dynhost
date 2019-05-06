# ovh-dynhost
Docker image to update an OVH dynhost regularly. Based on Alpine linux.

### Why
A DynHost is used to assign a dynamic ip to a subdomain.
This can be very useful to make your local development machine available via a public subdomain.

### Configure OVH
In your OVH domain settings head over to the `DynHost` tab and follow the steps to create your dynhost.

### Run container
The image is available via Docker Hub.

```
docker run \
  -e DYNHOST_DOMAIN_NAME=dynhost.example.com \
  -e DYNHOST_LOGIN=login \
  -e DYNHOST_PASSWORD=password \
  --restart always \
  --name ovh-dynhost \
  p4sca1/ovh-dynhost
```

**Or via docker-compose:**

```yml
version: "3"

services:
  ovh-dynhost:
    image: p4sca1/dynhost
    restart: always
    environment:
      DYNHOST_DOMAIN_NAME: dynhost.example.com
      DYNHOST_LOGIN: login
      DYNHOST_PASSWORD: password
```

Of course you need to insert your credentials.

This will update the dynhost every 15 minutes if the ip changed.

### Updating the dynhost manually
If your ip changed and you can't wait 15 minutes for the next update to happen, you can update the dynhost manually.

`docker container exec ovh-dynhost ./dynhost.sh`

**Or when using docker-compose:**

`docker-compose exec ovh-dynhost ./dynhost.sh`

### Checking for problems
The docker container will echo debug messages every 15 miuntes.
You can access them via

`docker container exec ovh-dynhost cat /usr/src/app/dynhost.log`

**Or when using docker-compose:**

`docker-compose  exec ovh-dynhost cat /usr/src/app/dynhost.log`
