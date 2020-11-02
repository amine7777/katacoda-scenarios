# Create an Ansible Galaxy role
After discovering how to use Ansible Galaxy roles we will see now how to create our own role using the default structure of Ansible Galaxy.


`ansible-galaxy role init my_awesome_role`{{execute}}

`cd my_awesome_role`{{execute}}

`ls -la -F`{{execute}}

As you can see here our role has been created with all the folders needed.
All what we have to do now is to write down our tasks and test with molecule.

If your are lazy like me :joy: there is a way to create a role from another role by using Ansible skeleton.

`cd ..`{{execute}}

`ansible-galaxy init --role-skeleton my_awesome_role my_new_role`{{execute}}

`cd my_new_role && ls -la -F`{{execute}}

As we can see we have the same structure as my_awesome_role.
