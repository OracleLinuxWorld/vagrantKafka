Vagrant.configure("2") do |config|

  # Define first Kafka broker node
  config.vm.define "kafka_broker_01" do |kafka_broker_01|
    # synced_folder only used in ansible_local setting
    # kafka_broker_01.vm.synced_folder "./vagrant", "/vagrant"
#    kafka_broker_01.vm.hostname = 'kafka-broker-01'
    kafka_broker_01.vm.box = "oraclelinuxworld/vagrant_kafka"
    kafka_broker_01.vm.network :"private_network", ip: "172.28.129.201", auto_config: true
#    kafka_broker_01.vm.network "forwarded_port", guest: 9092, host: 9092, protocol: "tcp"
#    kafka_broker_01.vm.network "forwarded_port", guest: 9021, host: 9021, protocol: "tcp"
#    kafka_broker_01.vm.network "forwarded_port", guest: 8083, host: 8083, protocol: "tcp"
#    kafka_broker_01.vm.network "forwarded_port", guest: 8082, host: 8082, protocol: "tcp"
#    kafka_broker_01.vm.network "forwarded_port", guest: 8081, host: 8081, protocol: "tcp"
#    kafka_broker_01.vm.network "forwarded_port", guest: 2181, host: 2181, protocol: "tcp"
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
#      kafka_broker_02.vm.hostname = 'kafka-broker-02'
      kafka_broker_02.vm.box = "oraclelinuxworld/vagrant_kafka"
      kafka_broker_02.vm.network :"private_network", ip: "172.28.129.202", auto_config: true
#      kafka_broker_02.vm.network "forwarded_port", guest: 9092, host: 29092, protocol: "tcp"
#      kafka_broker_02.vm.network "forwarded_port", guest: 9021, host: 29021, protocol: "tcp"
#      kafka_broker_02.vm.network "forwarded_port", guest: 8083, host: 28083, protocol: "tcp"
#      kafka_broker_02.vm.network "forwarded_port", guest: 8082, host: 28082, protocol: "tcp"
#      kafka_broker_02.vm.network "forwarded_port", guest: 8081, host: 28081, protocol: "tcp"
#      kafka_broker_02.vm.network "forwarded_port", guest: 2181, host: 22181, protocol: "tcp"
      kafka_broker_02.vm.provider :virtualbox do |v|
        v.customize ["modifyvm", :id, "--memory", 1024]
        v.customize ["modifyvm", :id, "--cpus", "2"]
        v.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]
        v.customize ["modifyvm", :id, "--usb", "off"]
        v.customize ["modifyvm", :id, "--audio", "none"]
        v.customize ["modifyvm", :id, "--name", "kafka_broker_02"]
      end # End of "kafka_broker_02.vm.provider"
    end   # End of config.vm.define "kafka_broker_02"

    # Define third Kafka broker node
    config.vm.define "kafka_broker_03" do |kafka_broker_03|
      # synced_folder only used in ansible_local setting
      # kafka_broker_03.vm.synced_folder "./vagrant", "/vagrant"
#      kafka_broker_03.vm.hostname = 'kafka-broker-03'
      kafka_broker_03.vm.box = "oraclelinuxworld/vagrant_kafka"
      kafka_broker_03.vm.network :"private_network", ip: "172.28.129.203", auto_config: true
#      kafka_broker_03.vm.network "forwarded_port", guest: 9092, host: 39092, protocol: "tcp"
#      kafka_broker_03.vm.network "forwarded_port", guest: 9021, host: 39021, protocol: "tcp"
#      kafka_broker_03.vm.network "forwarded_port", guest: 8083, host: 38083, protocol: "tcp"
#      kafka_broker_03.vm.network "forwarded_port", guest: 8082, host: 38082, protocol: "tcp"
#      kafka_broker_03.vm.network "forwarded_port", guest: 8081, host: 38081, protocol: "tcp"
#      kafka_broker_03.vm.network "forwarded_port", guest: 2181, host: 32181, protocol: "tcp"
      kafka_broker_03.vm.provider :virtualbox do |v|
        v.customize ["modifyvm", :id, "--memory", 1024]
        v.customize ["modifyvm", :id, "--cpus", "2"]
        v.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]
        v.customize ["modifyvm", :id, "--usb", "off"]
        v.customize ["modifyvm", :id, "--audio", "none"]
        v.customize ["modifyvm", :id, "--name", "kafka_broker_03"]
      end # End of "kafka_broker_03.vm.provider"
    end   # End of config.vm.define "kafka_broker_03"


  # Define first Kafka worker node
  config.vm.define "kafka_workernode_01" do |kafka_workernode_01|
    # synced_folder only used in ansible_local setting
    # kafka_workernode_01.vm.synced_folder "./vagrant", "/vagrant"
#    kafka_workernode_01.vm.hostname = 'kafka-workernode-01'
    kafka_workernode_01.vm.box = "oraclelinuxworld/vagrant_kafka"
    kafka_workernode_01.vm.network :"private_network", ip: "172.28.129.204", auto_config: true
    kafka_workernode_01.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--memory", 1024]
      v.customize ["modifyvm", :id, "--cpus", "2"]
      v.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]
      v.customize ["modifyvm", :id, "--usb", "off"]
      v.customize ["modifyvm", :id, "--audio", "none"]
      v.customize ["modifyvm", :id, "--name", "kafka_workernode_01"]
    end # End of "kafka_workernode_01.vm.provider"
  end   # End of config.vm.define "kafka_workernode_01"

  # Define second Kafka worker node
  config.vm.define "kafka_workernode_02" do |kafka_workernode_02|
    # synced_folder only used in ansible_local setting
    # kafka_workernode_02.vm.synced_folder "./vagrant", "/vagrant"
#    kafka_workernode_02.vm.hostname = 'kafka-workernode-02'
    kafka_workernode_02.vm.box = "oraclelinuxworld/vagrant_kafka"
    kafka_workernode_02.vm.network :"private_network", ip: "172.28.129.205", auto_config: true
    kafka_workernode_02.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--memory", 1024]
      v.customize ["modifyvm", :id, "--cpus", "2"]
      v.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]
      v.customize ["modifyvm", :id, "--usb", "off"]
      v.customize ["modifyvm", :id, "--audio", "none"]
      v.customize ["modifyvm", :id, "--name", "kafka_workernode_02"]
    end # End of "kafka_workernode_02.vm.provider"
  end   # End of config.vm.define "kafka_workernode_02"

  # Define MySQL database machine
  config.vm.define "mysql_node_01" do |mysql_node_01|
    # synced_folder only used in ansible_local setting
    # mysql_node_01.vm.synced_folder "./vagrant", "/vagrant"
#    mysql_node_01.vm.hostname = 'kafka-workernode-02'
    mysql_node_01.vm.box = "oraclelinuxworld/vagrant_kafka"
    mysql_node_01.vm.network :"private_network", ip: "172.28.129.205", auto_config: true
    mysql_node_01.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--memory", 1024]
      v.customize ["modifyvm", :id, "--cpus", "2"]
      v.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]
      v.customize ["modifyvm", :id, "--usb", "off"]
      v.customize ["modifyvm", :id, "--audio", "none"]
      v.customize ["modifyvm", :id, "--name", "mysql_node_01"]
    end # End of "mysql_node_01.vm.provider"
  end   # End of config.vm.define "mysql_node_01"

end       # End of "Vagrant.configure"
