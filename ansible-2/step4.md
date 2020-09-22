# What's vars?

Ansible is really powerful when it's about variables. The variables could be called either in the playbook, in the roles, in the templates or even to create a path to a certain directories or files inside the project or on the remote host. Of corse , like the hosts, the vars could be grouped and organized in several files and then we can call them by using vars_files. The only thing to add is a list of paths to these files.The files could be anywhere in the project but it's highly recommended to create **group_vars** directory because it's the default folder where Ansible will gather the variables.


Let's see how to put a variable in a playbook. We can delete what's in **simple_playbook.yml** and replace it by this play.

<pre class="file" data-target="clipboard">
- hosts: dev
  connection: local
  vars:
    file_path: 'group_vars/all/main.yml'
  tasks:
    - name: Insert a list of variable in group_vars/all/main.yml
      blockinfile:
        path: '{{ file_path }}'
        block: |
          folder_list:
            - inventory
            - roles
            - group_vars/all
            - roles/my_role
            - roles/my_role/tasks
            - roles/my_role/templates
            - roles/my_role/vars
</pre>

As you can above we have used a variable **file_path** which indicate the path to the main file of group_vars. With this play we will have a folder list which we can use it in another play.The **blockinfile** module helps us to make this possible. It's used to insert/update configurations.

Now we can re-execute the playbook.

 `ansible-playbook -i inventory/inventory_file simple_playbook.yml`{{execute}}

 After executing the playbook we can execute another play but this time using the folder list in group_vars.

 We can replace the play in **simple_playbook.yml** with the play below.

<pre class="file" data-target="clipboard">
 - hosts: dev
   connection: local
   vars:
     file_path: 'group_vars/all/main.yml'
   tasks:
     - name: Create folders
       file:
         path: /home/scrapbook/tutorial/{{ item }}
         state: directory
         owner: root
         group: root
         mode: 0755
       with_items:
         - '{{ folder_list }}'
</pre>

 After executing this play it will change nothing because these folders have been already created. We can see in the recap at the end of the execution that the tasks are green which means that the folders exists already.

`ansible-playbook -i inventory/inventory_file simple_playbook.yml -vvv`{{execute}}

**-vvv** runs the very verbose mode

 #### What's vars_files ?

 vars_files is a list of files which contains variables. If you have a specific variables for your tasks you can create a file where your will store these variables.
