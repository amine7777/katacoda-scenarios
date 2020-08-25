# What's Tasks?
As we know now, Ansible is a tool for provisioning and automating tasks. A task is a unit of action which should have a module for a particular use. This means that if you have any task to execute as command check if there is a module first because it's a good process to reach the genericity of your code.

Let's see how to create directories using *file* module.

First, in this step we are going to create an inventory file.

<pre class="file" data-target="clipboard">
localhost_machine  ansible_ssh_host=localhost

[dev]
localhost_machine
</pre>

Now we have our localhost machine in *dev* group. We need to replace localhost in *simple_playbook.yml* by *dev*

Then we are going to add this task at the end of *simple_playbook.yml* just below the first task.

<pre class="file" data-target="clipboard">
- name: Create a folder
  file:
    path: /home/scrapbook/tutorial/my_new_folder
    state: directory
    owner: scrapbook
    group: scrapbook
    mode: 0755    
</pre>

Now we can execute our playbook using this command.

`ansible-playbook -i inventory simple_playbook.yml`{{execute}}
