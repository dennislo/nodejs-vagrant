# nodejs-vagrant

Provisions a clean Ubuntu 12.04 32-bit server instance with all needed Node.js development tools (Node.js, git, vim); services (MongoDB, Redis, GitHub, Heroku, Travis-CI, Compass 'requires Ruby', Yeoman).

This provisioned Vagrant instance is setup with 2 CPU Cores and 2GB RAM.

## Install Vagrant & VirtualBox

### Install Vagrant 1.5:
[http://vagrantup.com](http://vagrantup.com)

### Install VirtualBox:
[https://www.virtualbox.org/wiki/Downloads](https://www.virtualbox.org/wiki/Downloads)

## Setup Option 1: Box

```
mkdir DIR && cd DIR
vagrant init cbumgard/nodejs
vagrant up
vagrant ssh
```

For more see: [https://vagrantcloud.com/cbumgard/nodejs](https://vagrantcloud.com/cbumgard/nodejs)

## Setup Option 2: Vagrantfile

```
git clone git@github.com:cbumgard/nodejs-vagrant.git
cd nodejs-vagrant
vagrant up
vagrant ssh
```

## Post-Setup

### Vagrant user

By default the ```vagrant``` user is configured with password 'vagrant'. The vagrant user is also configured for password-less sudo.

### Edit code on host machine, build in VM

Your ```~/``` home directory on your host machine is synced to the ```/host/``` directory inside of Vagrant. So for example you can edit code in ```~/code/``` on your laptop and build it inside a Vagrant shell inside ```/host/code```.


### Change number of CPU cores:

The provisioned machine is setup with 2 CPU cores. This can be  modified using the steps below:

Open the *Vagrantfile* and edit the line from 2 to another to set the CPU cores:
```
vb.customize ["modifyvm", :id, "--cpus"  , "2"   ]
```

then reload the machine
```
vagrant ssh
```

To check CPU cores has been changes, verify from CLI by running ```top``` or ```free -m```


### Change amount of RAM:

The provisioned machine is setup with with 2GB of RAM. This can be  modified using the steps below:

Open the *Vagrantfile* and edit the line from 2048 to another to set RAM:
```
vb.customize ["modifyvm", :id, "--memory", "2048"]
```

then reload the machine
```
vagrant ssh
```

To check RAM has been changes, verify from CLI by running ```top``` or ```free -m```

### Networking:

Configured for private network on static IP: ```192.168.33.10```, with port ```:3000``` forwarded.

So from a web browser you have two ways of accessing a node.js process for example running on port 3000 on the VM:

* ```localhost:3000```
* ```192.168.33.10:3000```

Additionally for convenience, append this line to your ```/etc/hosts``` file:

```192.168.33.10   vagrant.localhost```

## Services

### MongoDB & Redis

Verify from CLI by running ```mongodb``` and ```redis-cli```.


### Ruby & Compass

Verify from CLI by running ```ruby``` and ```compass```.

For documentation see: [http://compass-style.org/](http://compass-style.org/)

### Yeoman, Grunt & Bower

Verify from CLI by running ```yo```, ```grunt``` and ```bower```.

For documentation see: [http://yeoman.io/](http://yeoman.io/)


### GitHub

```
ssh-keygen -t rsa
(Copy the contents of ~/.ssh/id_rsa.pub into your GitHub account: https://github.com/settings/ssh)
git config --global user.name '<your name>'
git config --global user.email <your email>
```

### Heroku

```
Run the following commands to finish setting up Heroku:
heroku login
heroku keys:add
```

### Travis-CI

```travis login```
or
```travis login --pro```

## Troubleshooting

Included is a script ```./sh/repair-mac.sh``` that fixes the problem that occurs (usually after a forced reboot) where the following error shows up on 'vagrant up':

```bash
There was an error while executing `VBoxManage`, a CLI used by Vagrant
for controlling VirtualBox. The command and stderr is shown below.

Command: ["hostonlyif", "create"]

Stderr: 0%...
Progress state: NS_ERROR_FAILURE
VBoxManage: error: Failed to create the host-only adapter
VBoxManage: error: VBoxNetAdpCtl: Error while adding new interface: failed to open /dev/vboxnetctl: No such file or directory
VBoxManage: error: Details: code NS_ERROR_FAILURE (0x80004005), component HostNetworkInterface, interface IHostNetworkInterface
VBoxManage: error: Context: "int handleCreate(HandlerArg*, int, int*)" at line 66 of file VBoxManageHostonly.cpp
```

## License

[MIT](https://github.com/dennislo/nodejs-vagrant/blob/master/LICENSE)
