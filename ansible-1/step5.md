# What's templates?

Templates are used to create a generic and dynamic config files. Templates uses Jinja2 for templatization.

First, we need to add this template to roles/my_role/templates/template.j2.yml

<pre class="file" data-target="clipboard">
{{ variable1 }}
This line is not effected.
{{ variable2 }}
</pre>

Let's copy this play inside **simple_playbook.yml** file and replace the old play.

<pre class="file" data-target="clipboard">
- hosts: dev
  connection: local
  vars:
    variable1: 'Holà Chavales'
    variable2: 'learn Jinja2 to make dynamic config files'
  tasks:
    - name: Create a config file
      template:
        src: roles/my_role/templates/template.j2.yml
        dest: my_config_file.ym
</pre>

Now after executing this command you can notice that the config file has been created.

 `ansible-playbook -i inventory/inventory_file simple_playbook.yml`{{execute}}

  `ls -la -F`{{execute}}

  `cat my_config_file.yml`{{execute}}.
