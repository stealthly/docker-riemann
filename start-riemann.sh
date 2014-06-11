#!/bin/bash
sudo docker run -d --name="riemann" -h $1 -e HOST="$1" -p 4567:4567 -p 5555:5555 -p 5556:5556 stealthly/docker-riemann
