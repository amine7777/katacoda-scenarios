# What's vars?

Ansible is really powerful when it s about variables. The variables could be called either in the playbook, in the roles, in the templates or even to create a path to a certain directories or files inside the project or on the remote host. Of corse , like the hosts, the vars could be grouped and organized in several files and then we can call them by using vars_files. The only thing to add is a list of paths to these files.The files could be anywhere in the project but it s highly recommended to create group_vars directory because it's the default folder where Ansible will gather the variables.


jjd
