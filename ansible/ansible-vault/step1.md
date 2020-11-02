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
    - name: Create a user
      user:
        name: my-test-user
        group: toto
        password: 'my_awesome_password'
        shell: /bin/bash
        create_home: yes
        state: present
</pre>

Please copy the playbook in the  **simple_playbook.yml** file.

As you can the password here is visible which is something that we dont want to have.

The playbook made to  create a user and our goal here is to hide the user password with Ansible vault.

Let's create our **.secret.yml** file where we are going to encrypt our password.

`ansible-vault create .secrets.yml`{{execute}}

This command will create an encrypted file and it will prompt a message to set up the vault password that you would like to use. After entering the password you need to put all the sensitives data inside.

Please add this line to the **.secret.yml** file 

```yaml
user_password: 'my_awesome_password'

```
Now save the file by hiting 
 <kbd>ESC</kbd>  then <kbd>:wq!</kbd>.

If we try now to display the **.secrets.yml** file we will get a strange output with many numbers which means that our file is encrypted :lock:.

`cat .secret.yml`{{execute}}

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
    - name: Create a user
      user:
        name: my-test-user
        group: toto
        password: '{{ user_pasword }}
        shell: /bin/bash
        create_home: yes
        state: present
</pre>


Let's execute our playbook again but this time we are going to ask for the vault password.

`ansible-playbook simple_playbook.yml --ask-vault-pass`{{execute}}

Now you need to enter the password that you have chosen for **.secret.yml** file. After entring the password ansible create a user.


 
