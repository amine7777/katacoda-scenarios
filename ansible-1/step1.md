# Introduction
Ansible is tool which is very easy to use. Ansible uses YAML and JINJA2 languages to describe all the configurations. T

### Waht is a playbook?

A playbook is a file which describes a set of configuration management scripts that define how tasks are to be executed on remote hosts or a group of host machines. The scripts or instructions are written in YAML format. In fact, the elements inside the playbooks could either defined inside the playbook itself or in a different folders. The best practice is to create directories which makes your project more organized. Another special feature that could be interesting is that we could put many plays in one playbook.

This is the simplest playbook that we could create.

<pre class="file" data-target="clipboard">
- hosts: localhost
  connection: local
  tasks:
    - name: Display a message
      debug:
        msg: 'Holà Chavales'
</pre>

Let's copy this playbook in simple_playbook.yml and then execute the playbook with the following command.

`cd /home/scrapbook/tutorial`{{execute}}
`ls -la -F`{{execute}}
`ansible-playbook simple_playbook.yml`{{execute}}

The file above describes a play. A playbook could integrate multiple plays. This could be used to separate environments for example. We can create a play for each environment in the same playbook.


<pre class="file" data-target="clipboard">

- name: This play is for development
  hosts: localhost
  connection: local
  tasks:
    - name: Display a message
      debug:
        msg: 'Holà Chavales'

- name: This play is for production
  hosts: localhost
  connection: local
  tasks:
    - name: Display a message
      debug:
        msg: 'Holà Chavales'
</pre>

You can run these plays by running the following command

```bash
ansible-playbook <playbook_names>.yml
```

Let's explore a bit what we can find inside a play.
