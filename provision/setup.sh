#!/usr/bin/env bash

echo "############################## Cloning 23degree repository ##############################"

	# Change git branch to clone from here clone 
	git clone https://github.com/aldorado/23.git /home/vagrant/23degree/23degree/

	cp /home/vagrant/23degree/provision/.env /home/vagrant/23degree/23degree/.env


echo "###################################### Initialising Application ######################################"
	npm config set prefix '/home/vagrant/.npm-global'
	echo "export PATH=/home/vagrant/.npm-global/bin:$PATH" >> ~/.bashrc
	echo "export PATH=/home/vagrant/.npm-global/bin:$PATH" >> ~/.profile
	source ~/.bashrc
	source ~/.profile
	cd /home/vagrant/23degree/23degree/		
	echo "vagrant" | sudo -u vagrant npm install -d
	npm link bower
	npm link gulp
	bower install
	composer install
	php artisan migrate
	php artisan db:seed
	gulp