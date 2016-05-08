Vagrant.configure("2") do |config|
	#config.vm.box ="ubuntu/trusty64"
	config.vm.box = "23basebox"
	config.vm.box_url = "https://s3.eu-central-1.amazonaws.com/23box/23basebox"
	
	config.vm.network "private_network", ip: "192.168.23.23"
	config.vm.synced_folder "./", "/home/vagrant/23degree", create: true

	config.vm.provider "virtualbox" do |v|
		#v.name = "23degree Vagrantbox"
		v.customize ["modifyvm", :id, "--memory", "2048"]
		#v.cpus = 4
	end

	config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"

	config.vm.provision "shell", privileged: false, inline: <<-SHELL

		echo " █████╗ ██████╗ ██████╗ ███████╗ ██████╗ ██████╗ ███████╗███████╗"
		echo "╚════██╗╚════██╗██╔══██╗██╔════╝██╔════╝ ██╔══██╗██╔════╝██╔════╝"
		echo " █████╔╝ █████╔╝██║  ██║█████╗  ██║  ███╗██████╔╝█████╗  █████╗ " 
		echo "██╔═══╝  ╚═══██╗██║  ██║██╔══╝  ██║   ██║██╔══██╗██╔══╝  ██╔══╝ " 
		echo "███████╗██████╔╝██████╔╝███████╗╚██████╔╝██║  ██║███████╗███████╗"
		echo "╚══════╝╚═════╝ ╚═════╝ ╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝╚══════╝"

		echo "############################## Cloning 23degree repository ##############################"

			#Change git branch to clone from 
			git clone https://github.com/aldorado/23.git /home/vagrant/23degree/23degree/
			cp /home/vagrant/23degree/provision/.env /home/vagrant/23degree/23degree/.env


		echo "###################################### Initialising Application ######################################"
		
			npm config set prefix '/home/vagrant/.npm-global'
			echo "export PATH=/home/vagrant/.npm-global/bin:$PATH" >> ~/.bashrc
			source ~/.bashrc
			echo "export PATH=/home/vagrant/.npm-global/bin:$PATH" >> ~/.profile
			source ~/.profile
			cd /home/vagrant/23degree/23degree/		
			echo "vagrant" | sudo -u vagrant npm install -d
			bower install
			composer install
			php artisan migrate
			php artisan db:seed
			gulp

	SHELL
end