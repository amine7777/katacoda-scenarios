# Introduction
Ansible is tool which is very easy to use. Ansible uses YAML and JINJA2 languages to describe all the configurations. T

### Waht is a playbook?

A playbook is a file which describes a set of configuration management scripts that define how tasks are to be executed on remote hosts or a group of host machines. The scripts or instructions are written in YAML format. In fact, the elements inside the playbooks could either defined inside the playbook itself or in a different folders. The best practice is to create directories which makes your project more organized. Another special feature that could be interesting is that we could put many plays in one playbook.

This the simplest playbook that we could create.

```yaml
- hosts: localhost
  connection: local
  tasks:
    - name: Display a message
      debug:
        msg: 'Holà Chavales'
```

The file above describes a play. A playbook could integrate multiple plays. This could be used to separate environments for example. We can create a play for each environment in the same playbook.

Here is an example.

```yaml
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
```

You can run these plays by running the following command

```bash
ansible-playbook <playbook_names>.yml
```

Let's explore a bit what we can find inside a play.
