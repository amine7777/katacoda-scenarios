 <kbd>Please wait until ansible get installed</kbd>

# How to use Ansible Vault?

Let 's say we would like to create a user with a password but we would like to hide that password. Our first Ansible playbook will be the following:

<pre class="file" data-target="clipboard">
---
- hosts: localhost
  connection: local
  become: yes
  become_user: root
  
  vars:
    user_name: john
    group_name: doe
    sudoers_line: "%john ALL=(ALL) ALL"
    
  tasks:
    - name: Create a group
      group:
        name: "{{ group_name }}"
        state: present

    - name: Create a user
      user:
        name: "{{ user_name }}"
        group: "{{ group_name }}"
        password: "{{ 'password12345' | password_hash('sha512') }}"
        shell: /bin/bash
        create_home: yes
        state: present
        
    - name: Add user to sudoers 
      lineinfile:
        dest: /etc/sudoers
        state: present
        line: '{{ sudoers_line }}'
        insertafter: 'EOF'
</pre>

Please copy the playbook in the  **simple_playbook.yml** file.

As you can see the password here is visible which is something that we dont want to have. Plus, if we use a plain text password this may not work, that's why our password should be hashed by using jinja2 filters which handle the hashing ***password_hash('sha512')***.

The playbook made to create a user and our goal here is to hide the user password with Ansible vault.

Let's create our **.secrets.yml** file where we are going to encrypt our password.

`cd /home/amine7777`{{execute}}

`ansible-vault create .secrets.yml`{{execute}}

This command will create an encrypted file and it will prompt a message to set up the vault password that you would like to use. After entering the vault password you need to put all the sensitives data inside.

Please hit  <kbd>i</kbd> to insert text and add this line to the **.secrets.yml** file 

```yaml
user_password_vault: 'password12345'

```
Now save the file by hiting 
 <kbd>ESC</kbd>  then <kbd>:wq!</kbd>.

If we try now to display the **.secrets.yml** file we will get a strange output with many numbers which means that our file is encrypted.

`cat .secrets.yml`{{execute}}

After saving the file and checking if your variables are encrypted you need to adapt your playbook by calling the user_password variable.

first you need to add the **.secrets.yml** file to the playbook. Place these lines before **vars**.

```yaml
 vars_files:
    - "./.secrets.yml"
```
Then change the user password in the **Create a user** task.

```yaml
password: "{{ user_password | password_hash('sha512') }}"
```

Now we just need to **user_password** variable which calls our encrypted variable in **.secrets.yml** file. Add this in the **vars** field.

```yaml
user_password: '{{ user_password_vault }}'
```



Let's execute our playbook again but this time we are going to ask for the vault password.

`ansible-playbook simple_playbook.yml --ask-vault-pass`{{execute}}

Now you need to enter the vault password that you have chosen for **.secret.yml** file. After entring the password ansible will create a user.

let's check

`cat /etc/group`{{execute}}

The group and the user have been created.

Let's try to create a folder using john user.

`su john`{{execute}}

`sudo mkdir new_folder`{{execute}}

Enter the password

```yaml
password12345
```

The folder has been created.




 
