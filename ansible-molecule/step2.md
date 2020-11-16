# Explore molecule scenarios

Let's understand a bit the molecule files.

`cd default`{{execute}}

`ls -la -F`{{execute}}

`cat molecule.yml`{{execute}}

As we can see here this is the molecule configuration which contain the driver, plateform . provisionner and verifier. We can for example change the image that we want to use, add some options for the Ansible provisionner.

Let's see the other most important file.

`cat converge.yml`{{execute}}

This file contain the list of roles to execute. We can also replace roles by tasks and add tasks instead.

Lets go back to our role an try to write some tasks.

`cd ../../tasks`{{execute}}

Please copy and paste these tasks in main.yml

`vi main.yml`{{execute}}

Hit <kbd>i</kbd> to insert text.

<pre class="file" data-target="clipboard">
- name: Create a folder in /tmp
  file:
    path: /tmp/new_folder
    state: directory
    mode: '0755'

- name: Check if the folder exists.
  stat:
    path: /tmp/new_folder
  register: result
 
- name: Display message
  debug:
    msg: "Path exists and is a directory"
  when: result.stat.isdir is defined and result.stat.isdir
</pre>

Hit <kbd>:wq!</kbd> to save.

Now let's test these tasks with molecule. Molecule with create a container and execute this role.

`cd ..`{{execute}}

`molecule test`{{excute}}
