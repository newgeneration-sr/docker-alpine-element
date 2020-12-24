![docker build automated](https://img.shields.io/docker/cloud/automated/dotriver/element)
![docker build status](https://img.shields.io/docker/cloud/build/dotriver/element)
![docker build status](https://img.shields.io/docker/cloud/pulls/dotriver/element)

# Element (Riot) on Alpine Linux + S6 Overlay

# Auto configuration parameters :

- SYNAPSE_SERVER_URL = Synapse server URL 
- SYNAPSE_SERVER_DOMAIN = Synapse server domaine name ( Homeserver name )
- ELEMENT_SERVER_NAME = Name your element
- ELEMENT_BACKGROUND_URL = Set a background image to your element
- ELEMENT_LOGO_URL = = Set a logo image to your element

# compose file example

```
version: '3'

services:

  element:
    image: dotriver/element
    environment:
      - SYNAPSE_SERVER_URL=https://matrix.test.example
      - SYNAPSE_SERVER_DOMAIN=matrix.test.example
      - ELEMENT_SERVER_NAME="element test example"
      - ELEMENT_BACKGROUND_URL=http://img.test.example/bg.png
      - ELEMENT_LOGO_URL=http://img.test.example/logo.png
    ports:
      - 80:80
```