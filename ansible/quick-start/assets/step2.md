## What is hosts?

The hosts describes the target hosts. It can be a group of hosts a DNS of a machine or just a name. All of these hosts might be described in an inventory folder where we need to define the host IP and the SSH user since Ansible is agentless and uses SSH protocol to get connected to the machine. In order to make this happen you need to put your SSH public key in the authorized keys of your remote host even if the host machine is your localhost.

In a play we can add directly the hosts or set up an inventory file where all the host are well organized.

<img src="./assets/ansible-hosts.png" alt="ansible hosts" width="500"/>

## What is inventory?
Inventory is a file where your remote hosts are grouped and organized. By this way you could target easily a lot of machines. It's also a file to set up all ssh configurations about the host machine.

let's see how to create a hosts file.

```yaml

localhost  ansible_ssh_host=localhost

machine1   ansible_ssh_host=34.126.4.1     ansible_ssh_user=centos

machine2   ansible_ssh_host=10.56.98.1     ansible_ssh_user=centos

[dev]
machine1

[prod]
machine2

[prod:vars]
ansible_ssh_common_args='-o ProxyCommand="ssh -i ~/.ssh/<private_key> centos@34.126.4.1 -W %h:%p"'
```

We can verify if Ansible reach all the hosts by running this command.
`ansible all -m ping`

In our case the host that we are targeting is localhost.
 `ansible localhost -m ping`{{execute}}
