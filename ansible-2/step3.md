# Create an Ansible Galaxy role
After discovering how to use Ansible Galaxy roles we will see now how to create our own role using the default structure of Ansible Galaxy.


`ansible-galaxy role init my_awesome_role`{{execute}}

`cd my_awesome_role`{{execute}}

`ls -la -F`{{execute}}

As you can see here our role has been created with all the folders needed.
All what we have to do now is write down our tasks and test with molecule.
