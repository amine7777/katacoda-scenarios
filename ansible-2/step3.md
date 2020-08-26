# What's Tasks?
As we know now, Ansible is a tool for provisioning and automating tasks. A task is a unit of action which should have a module for a particular use. This means that if you have any task to execute as command check if there is a module first because it's a good process to reach the genericity of your code.

Let's see how to create directories using **file** module.

First, in this step we are going to create an inventory file '**inventory_file**'.

<pre class="file" data-target="clipboard">
localhost_machine  ansible_ssh_host=localhost

[dev]
localhost_machine
</pre>

Now we have our localhost machine in **dev** group. We need to replace **localhost** in **simple_playbook.yml** by **dev**

Then we are going to add this task at the end of **simple_playbook.yml** just below the first task.

<pre class="file" data-target="clipboard">
- name: Create a folder
  file:
    path: /home/scrapbook/tutorial/group_vars
    state: directory
    owner: root
    group: root
    mode: 0755    
</pre>

Now we can execute our playbook using this command.

`ansible-playbook -i inventory_file simple_playbook.yml`{{execute}}

`ls -la -F`{{execute}}

We can see now the folder has been created.

What if we need more folders for example a list of folders

Let's replace the task that we have added before with this task.

<pre class="file" data-target="clipboard">
- name: Create folders
  file:
    path: /home/scrapbook/tutorial/{{ item }}
    state: directory
    owner: root
    group: root
    mode: 0755
  with_items:
    - inventory
    - roles
    - group_vars/all
    - roles/my_role
    - roles/my_role/tasks
    - roles/my_role/templates
    - roles/my_role/vars     
</pre>

let's execute the playbook again.

`ansible-playbook -i inventory_file simple_playbook.yml`{{execute}}

`ls -la -F`{{execute}}

Now that we have created an inventory folder we can move the **inventory_file** there.

`mv inventory_file inventory/`{{execute}}

The **file** module could also create files by changing the state from **directory** to **touch**. We are going to add yml files inside the folders to have an organized structure of the playbook.

<pre class="file" data-target="clipboard">
- name: Create files
  file:
    path: /home/scrapbook/tutorial/{{ item }}
    state: touch
    owner: root
    group: root
    mode: 0755
  with_items:
    - group_vars/all/main.yml
    - roles/my_role/tasks/main.yml
    - roles/my_role/templates/template.j2.yml
    - roles/my_role/vars/main.yml
</pre>

Let's run the playbook to create these files.

`ansible-playbook -i inventory/inventory_file simple_playbook.yml`{{execute}}

`cd group_vars/all`{{execute}}

`ls -la -F`{{execute}}

`cd ../../`{{execute}}

Now we have an organized playbook which match with the Ansible default config.
