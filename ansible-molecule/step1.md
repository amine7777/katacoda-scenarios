# How to use Molecule ?

In this scenario we are going to use an isolated molecule in a docker container. However you can insall molecule by runing this command

`pip3 install molecule==3.0.8`

I recommend this version because it's the version that we are going to use in the container.

let's start by pulling the docker image.

`docker pull amine7777/molecule:3.0.8`{{execute}}

once the image is downloaded we need to run our container mounted to the docker socket to use the local daemon.

`docker run -it -v /var/run/docker.sock:/var/run/docker.sock amine7777/molecule:3.0.8`{{execute}}

We need to check if docker is runing in our container. `docker info` {{execute}}

With Molecule we can either create a new galaxy alike role with molecule folder inside or set up a molecule scenario in an existing role.

Let's create a role.

`molecule init role my_awesome_role`{{execute}}

`cd my_awesome_role`{{execute}}

`ls -la -F`{{execute}}

As you can see we have a role skeleton which we can edit.

Now, Let's delete the molecule folder.

`rm -rf molecule`{{execute}}

Molecule can have multiples scenarios of testing but first you need to have a default testing scenario this is how we create one.

`molecule init scenario`{{execute}}

If we want a customized scenario which for example runs on ubuntu distribution, we can create it with the following command.

`molecule init scenario`{{execute}}


