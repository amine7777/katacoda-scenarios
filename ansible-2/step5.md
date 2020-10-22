# Other features

### Remove a role
In case you need to remove a role from your **local machine** you do it by runing this command: 

`ansible-galaxy role remove amine7777.packer`{{execute}}

Let's see our list of roles:

`ansible-playbook list`{{execute}}

### Login to Ansible Galaxy

If you have an Ansible Galaxy account you can login by using your github credentials:

`ansible-galaxy login`{{execute}}

# Import a role to Ansible Galaxy 

After bieng connected you can import your role to Ansible Galaxy platform by runing this command:

`ansible-galaxy role import my_awesome_role`{{execute}}

You can delete the role by executing this :

`ansible-galaxy role delete <user>.my_awesome_role