

 <kbd>Please wait until ansible get installed</kbd>

# How to use Ansible Galaxy?

First, you need to search for the ansible galaxy role that you would like to install. You can check if the provider is trustworthy by checking his code. Then you need to run this command.

`ansible-galaxy install amine7777.packer`{{execute}}

`cd .ansible/roles`{{execute}}

`ls -la -F`{{execute}}

As we can see the the Ansible galaxy role has been installed.

`cd`{{execute}}

the role will be stored either on **.ansible/roles** or **/etc/ansible/roles** you can even edit the role if you found out some errors.

Now the role that we have choosen is to install packer on the machine. Let's make a play to install packer using this role.

The default variables are the following
```yaml
packer_version: 1.5.6
packer_arch: amd64
packer_directory_path: /usr/local/bin
```
Let's say we would like to install a new version 1.6.1. We need add a variable with the new version and copy this play in **simple_playbook.yml**.

<pre class="file" data-target="clipboard">
- hosts: localhost
  connection: local
  vars:
    packer_version: 1.6.1
  roles:
    - role: amine7777.packer
</pre>

Then run the following commands.

`cd /home/amine7777/`{{execute}}

`ls -la -F`{{execute}}

We can see our playbook. Now, it's time to run it.

`ansible-playbook simple_playbook.yml`{{execute}}

Let's check if Packer has been installed on the local machine.

`packer --version`{{execute}}
