# Other features

### Remove a role
In case you need to remove a role from your **local machine** you do it by runing this command: 

`ansible-galaxy role remove amine7777.packer`{{execute}}

Let's see our list of roles:

`ansible-galaxy list`{{execute}}

### Login to Ansible Galaxy

If you have an Ansible Galaxy account you can login by using your github credentials:

`ansible-galaxy login`{{execute}}

### Import a role to Ansible Galaxy 
Before importing you role to Ansible Galaxy website you need to put your role in a github repository,then after bieng connected you can import your role to Ansible Galaxy platform by runing this command:

`ansible-galaxy role import <GithubUser> my_awesome_role`

###  Delete 
You can delete the role by executing this :

`ansible-galaxy role delete <GithubUser>.my_awesome_role`