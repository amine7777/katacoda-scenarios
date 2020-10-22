## How to organize Ansible galaxy roles?

You might use more than one Ansible galaxy role. So the best practice is to create a **requirements.yml** file where all the Ansible galaxy roles will be described.

here an example:

<pre class="file" data-target="clipboard">
- src: amine7777.packer
  version: 1.0.0

- src: amine7777.terraform
  version: 1.0.0
</pre>

Then after filling the requirements file we can install all the roles by using this command:

`ansible-galaxy install -r requirements.yml`{{execute}}

Then the play will be like the following:

<pre class="file" data-target="clipboard">
- hosts: localhost
  connection: local
  vars:
    packer_version: 1.6.1
    terraform_version: 0.13.5
  roles:
    - role: amine7777.packer
    - role: amine7777.terraform
</pre>

As you can see we have two variables which describing respectively the version of Packer and the version of Terraform.

let's replace what's in the **simple_playbook.yml** by this play and execute the playbook.

`ansible-playbook simple_playbook.yml`{{execute}}

`packer --version`{{execute}}

`terraform --version`{{execute}}
