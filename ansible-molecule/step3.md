# How to trouble shoot our role?

We have until now how to use molecule for testing an Ansible role but molecule create an environment, runs Ansible then destroy the environment. All the process is virtual and hiden. What we would like to do is to get inside the container that molecule runs and check if the role executed have done the job required.

We can run this command to run just the role.

`molecule converge`{{execute}}

Then we can get into the container.

`molecule login`{{execute}}

Let's check if the folder is really there.

`cat /tmp`{{execute}}

We can see that the folder exists.

let's exit and destroy the environment 

`exit`{{execute}}

`molecule destroy`{{execute}}

If you want to avoid these steps and try to find errors with the verbose mode you can run the following command.

`molecule --debug test`{{execute}}
