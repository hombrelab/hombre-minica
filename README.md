# hombre-minica
![Docker Pulls](https://img.shields.io/docker/pulls/hombrelab/hombre-minica) ![Docker Image Version (latest by date)](https://img.shields.io/docker/v/hombrelab/hombre-minica) ![GitHub commit activity](https://img.shields.io/github/last-commit/hombrelab/hombre-minica)

The [hombre-minica](https://hub.docker.com/repository/docker/hombrelab/hombre-minica) image is based on the [hombre-golang](https://hub.docker.com/repository/docker/hombrelab/hombre-golang) image and [Minica v1.0.2](https://github.com/jsha/minica).  
It is a customized Docker image for and by [@Hombrelab](me@hombrelab.com).

Minica is a simple CA intended for use in situations where the CA operator also operates each host where a certificate will be used.
You can read more about Minica [here](https://github.com/jsha/minica).  

Generate a root key and cert in minica-key.pem and minica.pem, then generate and sign an end-entity key and cert, storing them in ./domain.com/

```shell script
docker run \
   -it \
   --name minica \
   --volume /home/data/minica:/output \
   hombrelab/hombre-minica
```
Alternative
```commandline
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout cert.key -out cert.crt
```
Change the access rights
```commandline
chmod 644 cert.crt
chmod 600 cert.key
```

With Traefik store them in {traefik home}/certs
```shell script
CN = .domain.com
```