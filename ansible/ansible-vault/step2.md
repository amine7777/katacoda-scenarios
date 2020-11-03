# How to edit an encrypted file

If we would like to edit the password or encrypt another variable we need to use this command.

`ansible-vault edit .secrets.yml`{{execute}}

You need to enter your vault password.
After editing you just hit <kbd>:wq!</kbd> to save and quit.

# How to read an encrypted file

Let's say you need to read your encrypted file to verify a value. This could be done by using this command.

`ansible-vault view .secrets.yml`{{execute}}

You need to enter your vault password.

# How to encrypt an existing file

Let's say we would like to encrypt the **simple_playbook.yml** file since it exists already. 

`cat simple_playbook.yml`{{execute}}

`ansible-vault encrypt simple_playbook.yml`{{execute}}

choose a vault password.

`cat simple_playbook.yml`{{execute}}

Now our playbook is encrypted.

# How to remove encryption from a file

Of course we are not going to leave our playbook encrypted like that. That's why we need to run this command:

`ansible-vault decrypt simple_playbook.yml --ask-vault-pass`{{execute}}

`cat simple_playbook.yml`{{execute}}

As you can see our playbook is now decrypted.

# Encrypt a string inside a value 

This can be used in step 1 because we just need to encrypt one string value or two otherwise the file will be a mess.

Let's try to encrypt the user_name inside out playbook.

`ansible-vault encrypt_string john`{{execute}}

`cat simple_playbook.yml`{{execute}}



