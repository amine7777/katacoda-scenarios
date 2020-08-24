# Introduction
Ansible is tool which is very easy to use. Ansible uses YAML and JINJA2 languages to describe all the configurations. T

### Playbook

A playbook is a file which describes a set of configuration management scripts that define how tasks are to be executed on remote hosts or a group of host machines. The scripts or instructions are written in YAML format. In fact, the elements inside the playbooks could either defined inside the playbook itself or in a different folders. The best practice is to create directories which makes your project more organized. Another special feature that could be interesting is that we could put many plays in one playbook.

This the simplest playbook that we could create.
``` yaml
- hosts: localhost
  connection: local
  tasks:
    - name: Display a message
      debug:
        msg: 'Holà Chavales'
```
`abs kff`{{copy}}

<pre class="file" data-target="clipboard">
Copy Me To The Clipboard!!
</pre>

`this sparta`
### Hosts
