# What's roles?

The roles directory contains all the roles that we could execute on the hosts. Each role should contains a folder called "tasks" where the tasks will be stored in main.yml file. Sometimes, you will have to manage many variables and templates that's why you have to create folders for them too, respectively "vars" and "templates".

<img src="./assets/ansible-hosts.png" alt="ansible hosts" width="500"/>


Let's put tasks in **roles/my_role/tasks/main.yml**.

<pre class="file" data-target="clipboard">
---
- name: Display a message
  debug:
    msg: 'This is a test'
- name: Create a config file
  template:
    src: roles/my_role/templates/template.j2.yml
    dest: /home/amine7777/my_config_file.ym
</pre>

Now after setting tasks we need to change the **simple_playbook.yml** again and replace the old play with this play.

<pre class="file" data-target="clipboard">
---
- hosts: dev
  connection: local
  roles:
    - role: my_role
</pre>

`ansible-playbook -i inventory/inventory_file simple_playbook.yml -e "variable1='Holà Chicos' variable2='It's the END of this Scenario'"`{{execute}}

`cat my_config_file$`{{execute}}
