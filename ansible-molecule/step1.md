# How to use Molecule ?

In this scenario we are going to use an isolated molecule in a docker container. However you can insall molecule by runing this command

`pip3 install molecule==3.0.8`

I recommend this version because it's the version that we are going to use in the container.

let's start by pulling the docker image.

`docker pull amine7777/molecule:latest`{{execute}}

once the image is downloaded we need to run our container mounted to the docker socket to use the local daemon.

`docker run -it -v /var/run/docker.sock:/var/run/docker.sock amine7777/molecule:latest`{{execute}}

