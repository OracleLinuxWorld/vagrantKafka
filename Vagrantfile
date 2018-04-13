Vagrant.configure("2") do |config|

  # Define first Kafka node
  config.vm.define "kafka_node_01" do |kafka_node_01|
    kafka_node_01.vm.synced_folder "./vagrant", "/vagrant"
    kafka_node_01.vm.box = "ol74"
    kafka_node_01.vm.hostname = 'kafka-node-01'
    kafka_node_01.vm.box_url = "http://yum.oracle.com/boxes/oraclelinux/ol74/ol74.box"
    kafka_node_01.vm.network :"private_network", type: "dhcp"
    kafka_node_01.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--memory", 1024]
      v.customize ["modifyvm", :id, "--cpus", "2"]
      v.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]
      v.customize ["modifyvm", :id, "--usb", "off"]
      v.customize ["modifyvm", :id, "--audio", "none"]
      v.customize ["modifyvm", :id, "--name", "kafka_node_01"]
    end # End of "kafka_node_01.vm.provider"
  end   # End of config.vm.define "kafka_node_01"


    # Run the same playbook on all hosts
    # :vars section provided as example on passing variables to
    # ansible in possible future versions
    config.vm.provision "ansible_local" do |ansible|
          ansible.verbose = "v"
          ansible.playbook = "ansible-playbook.yml"
          ansible.groups = {
            "kafkabrokers" => ["kafka_node_01"],
            "kafkabrokers:vars" => {"variable1" => "example1",
                                    "variable2" => "example2"}
          }
    end   # End of "config.vm.provision"

end       # End of "Vagrant.configure"
