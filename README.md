vagrant-lamp
======

Here is my Vagrant + Puppet LAMP setup - use how you like.

Things installed on the VM:
- PHP 5.3
- Apache
- MySQL

There is just a root user for the DB - you can change the pass to your choosing.

Ubuntu's default webserver path is symlinked to the www/ folder on the host
machine so put your projects in there and apache should serve them up.

PhpMyAdmin comes pre-installed so you can easily manage your databases.

Just vagrant up and navigate to http://127.0.0.1:4567/ and you'll be good to go.
