## What this module does

* Creats the servers according to:
  * The number which is given for each type (master and haproxy)
  * Image provided
  * Flavor provided
  * Name provided
* Dynamically creates the inventory file for ansible
* Also craetes the etc/hosts file for all nodes