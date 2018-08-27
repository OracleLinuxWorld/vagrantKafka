Vagrant.configure("2") do |config|

  # Define first Kafka broker node
  config.vm.define "kafka_broker_01" do |kafka_broker_01|
    # synced_folder only used in ansible_local setting
    # kafka_broker_01.vm.synced_folder "./vagrant", "/vagrant"
    kafka_broker_01.vm.box = "ol7-latest"
    kafka_broker_01.vm.hostname = 'kafka-broker-01'
    kafka_broker_01.vm.box_url = "https://yum.oracle.com/boxes/oraclelinux/latest/ol7-latest.box"
    kafka_broker_01.vm.network :"private_network", type: "dhcp"
    kafka_broker_01.vm.network "forwarded_port", guest: 9092, host: 9092, protocol: "tcp"
    kafka_broker_01.vm.network "forwarded_port", guest: 9021, host: 9021, protocol: "tcp"
    kafka_broker_01.vm.network "forwarded_port", guest: 8083, host: 8083, protocol: "tcp"
    kafka_broker_01.vm.network "forwarded_port", guest: 8082, host: 8082, protocol: "tcp"
    kafka_broker_01.vm.network "forwarded_port", guest: 8081, host: 8081, protocol: "tcp"
    kafka_broker_01.vm.network "forwarded_port", guest: 2181, host: 2181, protocol: "tcp"
    kafka_broker_01.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--memory", 1024]
      v.customize ["modifyvm", :id, "--cpus", "2"]
      v.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]
      v.customize ["modifyvm", :id, "--usb", "off"]
      v.customize ["modifyvm", :id, "--audio", "none"]
      v.customize ["modifyvm", :id, "--name", "kafka_broker_01"]
    end # End of "kafka_broker_01.vm.provider"
  end   # End of config.vm.define "kafka_broker_01"


    # Define second Kafka broker node
    config.vm.define "kafka_broker_02" do |kafka_broker_02|
      # synced_folder only used in ansible_local setting
      # kafka_broker_02.vm.synced_folder "./vagrant", "/vagrant"
      kafka_broker_02.vm.box = "ol7-latest"
      kafka_broker_02.vm.hostname = 'kafka-broker-02'
      kafka_broker_02.vm.box_url = "https://yum.oracle.com/boxes/oraclelinux/latest/ol7-latest.box"
      kafka_broker_02.vm.network :"private_network", type: "dhcp"
      kafka_broker_02.vm.network "forwarded_port", guest: 9092, host: 29092, protocol: "tcp"
      kafka_broker_02.vm.network "forwarded_port", guest: 9021, host: 29021, protocol: "tcp"
      kafka_broker_02.vm.network "forwarded_port", guest: 8083, host: 28083, protocol: "tcp"
      kafka_broker_02.vm.network "forwarded_port", guest: 8082, host: 28082, protocol: "tcp"
      kafka_broker_02.vm.network "forwarded_port", guest: 8081, host: 28081, protocol: "tcp"
      kafka_broker_02.vm.network "forwarded_port", guest: 2181, host: 22181, protocol: "tcp"
      kafka_broker_02.vm.provider :virtualbox do |v|
        v.customize ["modifyvm", :id, "--memory", 1024]
        v.customize ["modifyvm", :id, "--cpus", "2"]
        v.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]
        v.customize ["modifyvm", :id, "--usb", "off"]
        v.customize ["modifyvm", :id, "--audio", "none"]
        v.customize ["modifyvm", :id, "--name", "kafka_broker_02"]
      end # End of "kafka_broker_02.vm.provider"
    end   # End of config.vm.define "kafka_broker_02"


  # Define Kafka worker node
  config.vm.define "kafka_workernode_01" do |kafka_workernode_01|
    # synced_folder only used in ansible_local setting
    # kafka_workernode_01.vm.synced_folder "./vagrant", "/vagrant"
    kafka_workernode_01.vm.box = "ol7-latest"
    kafka_workernode_01.vm.hostname = 'kafka-workernode-01'
    kafka_workernode_01.vm.box_url = "https://yum.oracle.com/boxes/oraclelinux/latest/ol7-latest.box"
    kafka_workernode_01.vm.network :"private_network", type: "dhcp"
    kafka_workernode_01.vm.network "forwarded_port", guest: 3309, host: 3309, protocol: "tcp"
    kafka_workernode_01.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--memory", 1024]
      v.customize ["modifyvm", :id, "--cpus", "2"]
      v.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]
      v.customize ["modifyvm", :id, "--usb", "off"]
      v.customize ["modifyvm", :id, "--audio", "none"]
      v.customize ["modifyvm", :id, "--name", "kafka_workernode_01"]
    end # End of "kafka_workernode_01.vm.provider"
  end   # End of config.vm.define "kafka_workernode_01"


    # Run the same playbook on all hosts
    # :vars section provided as example on passing variables to
    # ansible in possible future versions
    config.vm.provision "ansible" do |ansible|
          ansible.verbose = "v"
          ansible.playbook = "vagrant/ansible-playbook.yml"
          ansible.limit = "all"
          ansible.groups = {
            "kafka_all" => ["kafka_broker_01", "kafka_broker_02", "kafka_workernode_01"],
            "kafka_brokers" => ["kafka_broker_01", "kafka_broker_02"],
            "kafka_brokers:vars" =>      {"variable1" => "example1",
                                          "variable2" => "example2"},
            "kafka_worker_nodes" => ["kafka_workernode_01"],
            "kafka_worker_nodes:vars" => {"variable1" => "example1",
                                          "variable2" => "example2"}
          }
    end   # End of "config.vm.provision"

end       # End of "Vagrant.configure"
