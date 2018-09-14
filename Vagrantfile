Vagrant.configure("2") do |config|

###
### DC-1
###

  # Define first Kafka broker node
  config.vm.define "kafka_broker_01" do |kafka_broker_01|
    kafka_broker_01.vm.box = "oraclelinuxworld/vagrant_kafka"
    kafka_broker_01.vm.network :"private_network", ip: "172.28.129.201", auto_config: true
    kafka_broker_01.vm.network "forwarded_port", guest: 9092, host: 19092, protocol: "tcp"
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
      kafka_broker_02.vm.box = "oraclelinuxworld/vagrant_kafka"
      kafka_broker_02.vm.network :"private_network", ip: "172.28.129.202", auto_config: true
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
      kafka_broker_03.vm.box = "oraclelinuxworld/vagrant_kafka"
      kafka_broker_03.vm.network :"private_network", ip: "172.28.129.203", auto_config: true
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
    kafka_workernode_01.vm.box = "oraclelinuxworld/vagrant_kafka"
    kafka_workernode_01.vm.network :"private_network", ip: "172.28.129.204", auto_config: true
    kafka_workernode_01.vm.network "forwarded_port", guest: 8081, host: 18081, protocol: "tcp"
    kafka_workernode_01.vm.network "forwarded_port", guest: 8082, host: 18082, protocol: "tcp"
    kafka_workernode_01.vm.network "forwarded_port", guest: 8083, host: 18083, protocol: "tcp"
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
    mysql_node_01.vm.box = "oraclelinuxworld/vagrant_kafka"
    mysql_node_01.vm.network :"private_network", ip: "172.28.129.206", auto_config: true
    mysql_node_01.vm.network "forwarded_port", guest: 3306, host: 13306, protocol: "tcp"
    mysql_node_01.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--memory", 1024]
      v.customize ["modifyvm", :id, "--cpus", "2"]
      v.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]
      v.customize ["modifyvm", :id, "--usb", "off"]
      v.customize ["modifyvm", :id, "--audio", "none"]
      v.customize ["modifyvm", :id, "--name", "mysql_node_01"]
    end # End of "mysql_node_01.vm.provider"
  end   # End of config.vm.define "mysql_node_01"

  # Define node for Confluent Control Center
  config.vm.define "kafka_control_center_01" do |kafka_control_center_01|
    kafka_control_center_01.vm.box = "oraclelinuxworld/vagrant_kafka"
    kafka_control_center_01.vm.network :"private_network", ip: "172.28.129.207", auto_config: true
    kafka_control_center_01.vm.network "forwarded_port", guest: 9021, host: 19021, protocol: "tcp"
    kafka_control_center_01.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--memory", 1024]
      v.customize ["modifyvm", :id, "--cpus", "2"]
      v.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]
      v.customize ["modifyvm", :id, "--usb", "off"]
      v.customize ["modifyvm", :id, "--audio", "none"]
      v.customize ["modifyvm", :id, "--name", "kafka_control_center_01"]
    end # End of "kafka_control_center_01.vm.provider"
  end   # End of config.vm.define "kafka_control_center_01"

  # Define node for Elastic Search Node
  config.vm.define "elasticsearch_node_01" do |elasticsearch_node_01|
    elasticsearch_node_01.vm.box = "oraclelinuxworld/base_elasticsearch"
    elasticsearch_node_01.vm.network :"private_network", ip: "172.28.129.208", auto_config: true
    elasticsearch_node_01.vm.network "forwarded_port", guest: 9200, host: 19200, protocol: "tcp"
    elasticsearch_node_01.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--memory", 1024]
      v.customize ["modifyvm", :id, "--cpus", "2"]
      v.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]
      v.customize ["modifyvm", :id, "--usb", "off"]
      v.customize ["modifyvm", :id, "--audio", "none"]
      v.customize ["modifyvm", :id, "--name", "elasticsearch_node_01"]
    end # End of "elasticsearch_node_01.vm.provider"
  end   # End of config.vm.define "elasticsearch_node_01"





  ###
  ### DC-2
  ###

    # Define first Kafka broker node
    config.vm.define "dc2_kafka_broker_01" do |dc2_kafka_broker_01|
      dc2_kafka_broker_01.vm.box = "oraclelinuxworld/vagrant_kafka"
      dc2_kafka_broker_01.vm.network :"private_network", ip: "172.28.129.221", auto_config: true
      dc2_kafka_broker_01.vm.provider :virtualbox do |v|
        v.customize ["modifyvm", :id, "--memory", 1024]
        v.customize ["modifyvm", :id, "--cpus", "2"]
        v.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]
        v.customize ["modifyvm", :id, "--usb", "off"]
        v.customize ["modifyvm", :id, "--audio", "none"]
        v.customize ["modifyvm", :id, "--name", "dc2_kafka_broker_01"]
      end # End of "dc2_kafka_broker_01.vm.provider"
    end   # End of config.vm.define "dc2_kafka_broker_01"


      # Define second Kafka broker node
      config.vm.define "dc2_kafka_broker_02" do |dc2_kafka_broker_02|
        dc2_kafka_broker_02.vm.box = "oraclelinuxworld/vagrant_kafka"
        dc2_kafka_broker_02.vm.network :"private_network", ip: "172.28.129.222", auto_config: true
        dc2_kafka_broker_02.vm.provider :virtualbox do |v|
          v.customize ["modifyvm", :id, "--memory", 1024]
          v.customize ["modifyvm", :id, "--cpus", "2"]
          v.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]
          v.customize ["modifyvm", :id, "--usb", "off"]
          v.customize ["modifyvm", :id, "--audio", "none"]
          v.customize ["modifyvm", :id, "--name", "dc2_kafka_broker_02"]
        end # End of "dc2_kafka_broker_02.vm.provider"
      end   # End of config.vm.define "dc2_kafka_broker_02"

      # Define third Kafka broker node
      config.vm.define "dc2_kafka_broker_03" do |dc2_kafka_broker_03|
        dc2_kafka_broker_03.vm.box = "oraclelinuxworld/vagrant_kafka"
        dc2_kafka_broker_03.vm.network :"private_network", ip: "172.28.129.223", auto_config: true
        dc2_kafka_broker_03.vm.provider :virtualbox do |v|
          v.customize ["modifyvm", :id, "--memory", 1024]
          v.customize ["modifyvm", :id, "--cpus", "2"]
          v.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]
          v.customize ["modifyvm", :id, "--usb", "off"]
          v.customize ["modifyvm", :id, "--audio", "none"]
          v.customize ["modifyvm", :id, "--name", "dc2_kafka_broker_03"]
        end # End of "dc2_kafka_broker_03.vm.provider"
      end   # End of config.vm.define "dc2_kafka_broker_03"


    # Define first Kafka worker node
    config.vm.define "dc2_kafka_workernode_01" do |dc2_kafka_workernode_01|
      dc2_kafka_workernode_01.vm.box = "oraclelinuxworld/vagrant_kafka"
      dc2_kafka_workernode_01.vm.network :"private_network", ip: "172.28.129.224", auto_config: true
      dc2_kafka_workernode_01.vm.network "forwarded_port", guest: 8081, host: 28081, protocol: "tcp"
      dc2_kafka_workernode_01.vm.network "forwarded_port", guest: 8082, host: 28082, protocol: "tcp"
      dc2_kafka_workernode_01.vm.network "forwarded_port", guest: 8083, host: 28083, protocol: "tcp"
      dc2_kafka_workernode_01.vm.provider :virtualbox do |v|
        v.customize ["modifyvm", :id, "--memory", 1024]
        v.customize ["modifyvm", :id, "--cpus", "2"]
        v.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]
        v.customize ["modifyvm", :id, "--usb", "off"]
        v.customize ["modifyvm", :id, "--audio", "none"]
        v.customize ["modifyvm", :id, "--name", "dc2_kafka_workernode_01"]
      end # End of "dc2_kafka_workernode_01.vm.provider"
    end   # End of config.vm.define "dc2_kafka_workernode_01"

    # Define second Kafka worker node
    config.vm.define "dc2_kafka_workernode_02" do |dc2_kafka_workernode_02|
      dc2_kafka_workernode_02.vm.box = "oraclelinuxworld/vagrant_kafka"
      dc2_kafka_workernode_02.vm.network :"private_network", ip: "172.28.129.225", auto_config: true
      dc2_kafka_workernode_02.vm.provider :virtualbox do |v|
        v.customize ["modifyvm", :id, "--memory", 1024]
        v.customize ["modifyvm", :id, "--cpus", "2"]
        v.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]
        v.customize ["modifyvm", :id, "--usb", "off"]
        v.customize ["modifyvm", :id, "--audio", "none"]
        v.customize ["modifyvm", :id, "--name", "dc2_kafka_workernode_02"]
      end # End of "dc2_kafka_workernode_02.vm.provider"
    end   # End of config.vm.define "dc2_kafka_workernode_02"

    # Define MySQL database machine
    config.vm.define "dc2_mysql_node_01" do |dc2_mysql_node_01|
      dc2_mysql_node_01.vm.box = "oraclelinuxworld/vagrant_kafka"
      dc2_mysql_node_01.vm.network :"private_network", ip: "172.28.129.226", auto_config: true
      dc2_mysql_node_01.vm.network "forwarded_port", guest: 3306, host: 23306, protocol: "tcp"
      dc2_mysql_node_01.vm.provider :virtualbox do |v|
        v.customize ["modifyvm", :id, "--memory", 1024]
        v.customize ["modifyvm", :id, "--cpus", "2"]
        v.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]
        v.customize ["modifyvm", :id, "--usb", "off"]
        v.customize ["modifyvm", :id, "--audio", "none"]
        v.customize ["modifyvm", :id, "--name", "dc2_mysql_node_01"]
      end # End of "dc2_mysql_node_01.vm.provider"
    end   # End of config.vm.define "dc2_mysql_node_01"

    # Define node for Confluent Control Center
    config.vm.define "dc2_kafka_control_center_01" do |dc2_kafka_control_center_01|
      dc2_kafka_control_center_01.vm.box = "oraclelinuxworld/vagrant_kafka"
      dc2_kafka_control_center_01.vm.network :"private_network", ip: "172.28.129.227", auto_config: true
      dc2_kafka_control_center_01.vm.network "forwarded_port", guest: 9021, host: 29021, protocol: "tcp"
      dc2_kafka_control_center_01.vm.provider :virtualbox do |v|
        v.customize ["modifyvm", :id, "--memory", 1024]
        v.customize ["modifyvm", :id, "--cpus", "2"]
        v.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]
        v.customize ["modifyvm", :id, "--usb", "off"]
        v.customize ["modifyvm", :id, "--audio", "none"]
        v.customize ["modifyvm", :id, "--name", "dc2_kafka_control_center_01"]
      end # End of "dc2_kafka_control_center_01.vm.provider"
    end   # End of config.vm.define "dc2_kafka_control_center_01"

    # Define node for Elastic Search Node
    config.vm.define "dc2_elasticsearch_node_01" do |dc2_elasticsearch_node_01|
      dc2_elasticsearch_node_01.vm.box = "oraclelinuxworld/base_elasticsearch"
      dc2_elasticsearch_node_01.vm.network :"private_network", ip: "172.28.129.228", auto_config: true
      dc2_elasticsearch_node_01.vm.network "forwarded_port", guest: 9200, host: 29200, protocol: "tcp"
      dc2_elasticsearch_node_01.vm.provider :virtualbox do |v|
        v.customize ["modifyvm", :id, "--memory", 1024]
        v.customize ["modifyvm", :id, "--cpus", "2"]
        v.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]
        v.customize ["modifyvm", :id, "--usb", "off"]
        v.customize ["modifyvm", :id, "--audio", "none"]
        v.customize ["modifyvm", :id, "--name", "dc2_elasticsearch_node_01"]
      end # End of "dc2_elasticsearch_node_01.vm.provider"
    end   # End of config.vm.define "dc2_elasticsearch_node_01"


end       # End of "Vagrant.configure"
