#!/bin/bash

# Conf PATH
sed -i 's/^PATH=/PATH=\/opt\/mysql\/bin:/' ~/.bash_profile
source ~/.bash_profile

echo "alias mysql=\"/opt/mysql/bin/mysql --prompt=\"(\u@\h) [\d] \R:\m:\\s> \"\"" >> ~/.bashrc
source ~/.bashrc
