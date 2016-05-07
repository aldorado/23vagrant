# 23vagrant
##### Creates a vagrantbox ready for use with 23degree
## Requirements
[Virtual Box](https://www.virtualbox.org/)

[Vagrant](https://www.vagrantup.com/)


## Usage

To change to the original repository of the the 23 degree mapplication change

line 91 in varantfile

from git clone https://github.com/aldorado/23.git /home/vagrant/23degree/23degree/
to git clone https://github.com/magnolo/23.git /home/vagrant/23degree/23degree/

```
git clone https://github.com/aldorado/23vagrant.git 23box
cd 23box
vagrant up
```

Go for a walk or do something else, this process can take up to 20 minutes


!!!Caution, the VM Box is set to use 4gb ram edit line 10

> v.customize ["modifyvm", :id, "--memory", "4096"]

and write instead of 4096 something else to customize

working files under
```
23box/23degree/
```

You can use gulp & gulp watch locally or ssh into the vagrant box and use gulp watch there, I recommend using it locally