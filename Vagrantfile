#BLOCO DE IP PÚBLICO (LAN) UTILIZADO NAS MÁQUINAS
BRIDGE_NET="10.0.0."

#LAÇO DE HOSTS QUE SERÃO CRIADOS
servers = [
  { :hostname => "master", :box => "bento/ubuntu-22.04", :ram => 1024, :ip=> BRIDGE_NET + "150", :cpu => 1 },
  { :hostname => "node01", :box => "bento/ubuntu-22.04", :ram => 1024, :ip=> BRIDGE_NET + "151", :cpu => 1 },
  { :hostname => "node02", :box => "bento/ubuntu-22.04", :ram => 1024, :ip=> BRIDGE_NET + "152", :cpu => 1 },
  { :hostname => "node03", :box => "bento/ubuntu-22.04", :ram => 1024, :ip=> BRIDGE_NET + "153", :cpu => 1 }
  ]

Vagrant.configure("2") do |config|
  servers.each do |machine|
    config.vm.define machine[:hostname] do |machines|
      machines.vm.box = machine[:box]
      machines.vm.hostname = machine[:hostname]
      machines.vm.network "public_network", ip: machine[:ip]
      machines.vm.provider "virtualbox" do |vb|
        vb.name = machine[:hostname]
        vb.memory = machine[:ram]
        vb.cpus = machine[:cpu]
      end
      machines.vm.provision "shell", path: "instalar-docker.sh"
      if(machine[:hostname] == "master") #SE O HOST FOR O 'MASTER', ENTÃO ELE SERÁ O GERENCIADOR DO CLUSTER
            machines.vm.provision "shell", path: "manager-script.sh"
      else    #CASO CONTRÁRIO, TODOS OS OUTROS HOSTS SERÃO INSERIDOS NO NÓ COMO 'WORKERS'
            machines.vm.provision "shell", path: "worker-script.sh"
      end
    end
  end
end