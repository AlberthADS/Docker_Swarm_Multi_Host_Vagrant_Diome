#!/bin/bash
#SCRIPT PARA ADICIONAR O GERENCIADOR DO N� DO CLUSTER

echo "Aplicando o host como o 'Manager'..."
sudo docker swarm init --advertise-addr=10.0.0.150

echo "Salvando o token 'worker'..."
sudo docker swarm join-token --quiet worker > /vagrant/worker_token
