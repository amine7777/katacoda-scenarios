 <kbd>Please wait until ansible get installed</kbd>

# How to use Ansible Vault?

Let 's say we would like to encrypt a file where we are going to store a password. Our Ansible playbook will be the following:

<pre class="file" data-target="clipboard">
---
- hosts: localhost
  connection: local
  become: yes
  become_user: root
  tasks:
    - name: Create a group
      group:
        name: doe
        state: present

    - name: Create a user
      user:
        name: john
        groups: sudo, doe
        password: 'my_awesome_password'
        shell: /bin/bash
        create_home: yes
        state: present
</pre>

Please copy the playbook in the  **simple_playbook.yml** file.

As you can see the password here is visible which is something that we dont want to have.

The playbook made to  create a user and our goal here is to hide the user password with Ansible vault.

Let's create our **.secret.yml** file where we are going to encrypt our password.

`cd /home/amine7777`{{execute}}

`ansible-vault create .secrets.yml`{{execute}}

This command will create an encrypted file and it will prompt a message to set up the vault password that you would like to use. After entering the vault password you need to put all the sensitives data inside.

Please hit  <kbd>i</kbd> to insert text and add this line to the **.secret.yml** file 

```yaml
user_password: 'my_awesome_password'

```
Now save the file by hiting 
 <kbd>ESC</kbd>  then <kbd>:wq!</kbd>.

If we try now to display the **.secrets.yml** file we will get a strange output with many numbers which means that our file is encrypted :lock:.

`cat .secrets.yml`{{execute}}

After saving the file and checking if your variables are encrypted you need to adapt your playbook by calling the user_password variable.

<pre class="file" data-target="clipboard">
---
- hosts: localhost
  connection: local
  become: yes
  become_user: root
  vars_files:
    - "./.secret.yml"
  tasks:
    - name: Create a group
      group:
        name: doe
        state: present

    - name: Create a user
      user:
        name: john
        groups: sudo, doe
        password: '{{ user_pasword }}'
        shell: /bin/bash
        create_home: yes
        state: present
</pre>


Let's execute our playbook again but this time we are going to ask for the vault password.

`ansible-playbook simple_playbook.yml --ask-vault-pass`{{execute}}

Now you need to enter the vault password that you have chosen for **.secret.yml** file. After entring the password ansible will create a user.

let's check:
`cat /etc/group`{{execute}}

`cat /etc/passwd`{{execute}}

The group and the user have been created.





 
