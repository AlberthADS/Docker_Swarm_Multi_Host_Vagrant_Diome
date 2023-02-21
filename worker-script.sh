#!/bin/bash
#SCRIPT PARA ADICIONAR OS HOSTS COMO 'WORKERS' NO NÓ DO CLUSTER

echo "Adicionando o host como 'Worker'..."
sudo docker swarm join --token $(cat /vagrant/worker_token) 10.0.0.150:2377
