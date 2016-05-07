Vagrant.configure("2") do |config|
	#config.vm.box ="ubuntu/trusty64"
	config.vm.box = "ubuntu/trusty32"
	
	config.vm.network "private_network", ip: "192.168.23.23"
	config.vm.synced_folder "./", "/home/vagrant/23degree", create: true

	config.vm.provider "virtualbox" do |v|
		#v.name = "23degree Vagrantbox"
		v.customize ["modifyvm", :id, "--memory", "4096"]
	end

	config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"

	config.vm.provision "shell", privileged: false, inline: <<-SHELL

echo " █████╗ ██████╗ ██████╗ ███████╗ ██████╗ ██████╗ ███████╗███████╗"
echo "╚════██╗╚════██╗██╔══██╗██╔════╝██╔════╝ ██╔══██╗██╔════╝██╔════╝"
echo " █████╔╝ █████╔╝██║  ██║█████╗  ██║  ███╗██████╔╝█████╗  █████╗ " 
echo "██╔═══╝  ╚═══██╗██║  ██║██╔══╝  ██║   ██║██╔══██╗██╔══╝  ██╔══╝ " 
echo "███████╗██████╔╝██████╔╝███████╗╚██████╔╝██║  ██║███████╗███████╗"
echo "╚══════╝╚═════╝ ╚═════╝ ╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝╚══════╝"
                                                                 
	echo "####################### Updating & Installing System Packages ##########################"
		sudo sed -i 's|http://us.|http://de.|g' /etc/apt/sources.list
		sudo add-apt-repository ppa:ondrej/php5 -y > /dev/null
		sudo apt-get update > /dev/null
 		sudo apt-get install -y build-essential git subversion git-core curl libssl-dev libnotify-bin > /dev/null
    	sudo apt-get install python-software-properties python g++ make -y  > /dev/null

	echo "#################################### Installing PHP ####################################"
    sudo apt-get install php5-common php5-dev php5-cli php5-fpm -y > /dev/null
    
	echo "############################### Installing PHP extensions ##############################"
    	sudo apt-get install curl php5-curl php5-gd php5-mcrypt php5-pgsql -y > /dev/null

  	echo "################################### Installing Nginx ###################################"
		sudo apt-get install nginx -y 

  	echo "################################# Installing Composer ##################################"

  		curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer> /dev/null

	echo "#################### Installing PostgreSQL with PostGIS extension ######################"
		sudo apt-get install postgresql postgresql-contrib -y > /dev/null
		sudo apt-get install postgis postgresql-9.3-postgis-2.1 -y > /dev/null

	echo "########## Creating PostgreSQL Database and User, adding PostGis extension #############"
		sudo -u postgres psql -c "CREATE USER degree WITH PASSWORD 'degree';"
		sudo -u postgres psql -c "CREATE DATABASE degree WITH OWNER degree ENCODING='UTF8' CONNECTION LIMIT = -1;"
		sudo -u postgres psql -c "CREATE EXTENSION postgis; CREATE EXTENSION postgis_topology;" degree

	echo "########################### Installing nodejs 5+ ################################"

		curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -
		sudo apt-get install -y nodejs
		echo "node version"
		node -v
		echo "npm version"
		npm -v
		#sudo chown -R vagrant $(npm config get prefix)/{lib/node_modules,bin,share}
		mkdir ~/.npm-global
		npm config set prefix '/home/vagrant/.npm-global'
		echo "export PATH=/home/vagrant/.npm-global/bin:$PATH" >> ~/.bashrc
		source ~/.bashrc

		npm install -g npm

	echo "################################ Installing gulp & bower ################################"

		npm install -g bower gulp
		source ~/.bashrc
		npm link bower
		npm link gulp

	echo "################################## Configuring php & nginx ###################################"

		sudo cp /home/vagrant/23degree/provision/www.conf /etc/php5/fpm/pool.d/www.conf
		sudo service php5-fpm restart
    	sudo cp /home/vagrant/23degree/provision/nginx_vhost /etc/nginx/sites-available/default
    	sudo service nginx restart 
    	sudo cp /home/vagrant/23degree/provision/setup.sh /home/vagrant/23degree/setup.sh
    	cd /home/vagrant/23degree/
    	./setup.sh 

	SHELL

	#config.vm.provision "shell" do |s|
	#	s.path = "provision/setup.sh"
	#end
end