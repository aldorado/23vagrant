#!/usr/bin/env bash

echo "############################## Cloning 23degree repository ##############################"

# Change git branch to clone from here clone 
	git clone https://github.com/aldorado/23.git /home/vagrant/23degree/23degree/

	#cp /home/vagrant/23degree/provision/bower.json /home/vagrant/23degree/23degree/bower.json
	cp /home/vagrant/23degree/provision/.env /home/vagrant/23degree/23degree/.env


echo "###################################### Initialising Application ######################################"
	cd /home/vagrant/23degree/23degree/		
	echo "vagrant" | sudo npm install -d
	sudo -u vagrant bower install --force-latest
	composer install
	php artisan migrate
	php artisan db:seed
	gulp