# How to use Ansible vault with other technologies

It becomes a little bit tricky when you want to combine Ansible Vault with other technologies but we are going to see how to manage this.

# Vagrant 

Let's see how vagrant manage the execution of an ansible playbook if this one is using encrypted variables. Here is an example of Vagrantfile.

```yaml
Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
 
  # Run Ansible from the Vagrant Host
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "playbook.yml"
    ansible.ask_vault_pass = true
  end
end
```
If we execute the Vagrantfile using ***vagrant up*** the terminal will prompt a message where we have to enter the vault password.


# Gitlab CI

If we want to use ansible-vault inside a pipeline we need to save the vault password in Gitlab. We have to go inside the project then

settings → CI/CD → Variables and save the variable there as ANSIBLE_VAULT_PASSWORD.

After that we need to store the vault password inside a file during the pipeline execution. The pipeline runs with docker container which is stateless so the file will not be saved inside the container.

You need to add these lines to your .gitlab-ci.yml

```yaml
variables:
  ANSIBLE_VAULT_PASSWORD_FILE: $CI_PROJECT_DIR/.vault
 
before_script:
  - echo "$ANSIBLE_VAULT_PASSWORD" > $ANSIBLE_VAULT_PASSWORD_FILE
```

# Molecule

If you would like to use molecule for testing Ansible playbooks we need to manage all the playbooks where variables are encrypted by ansible-vault. To use molecule and ansible-vault locally  you need to place your ansible vault password inside a file which is not secure. So you have to delete the file after testing.

`ANSIBLE_VAULT_PASSWORD_FILE=/path/to/vault-password-file molecule test`{{execute}}

Another way to place the vault password file path into molecule is to include it inside the molecule scenario but of course this is not secure it s an option for testing locally and locally only.

*Please do not commit your vault password file. Please use .gitignore to avoid this action.*

```yaml
---
dependency:
  name: galaxy
driver:
  name: docker
platforms:
  - name: instance
    image: docker.io/pycontribs/centos:7
    pre_build_image: true
provisioner:
  name: ansible
  options:
    vault-id: '/path/to/vault-password-file'
verifier:
  name: ansible
```



