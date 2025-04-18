#!/bin/bash

#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"


function dockerInstall(){
  user=$(whoami)
  echo -e "\n\t${grayColour}[~] Comenzando la instalación de ${turquoiseColour}Docker${endColour}\n"
  sleep 2
	echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian bookworm stable" | sudo tee /etc/apt/sources.list.d/docker.list
	curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
	sudo apt update
	sudo apt install -y docker-ce docker-ce-cli containerd.io
	sleep 2

  echo -e "\n\t${grayColour}[~] Comenzando la instalación de ${turquoiseColour}docker-compose${endColour}\n"
	cd $HOME/Downloads/
	wget https://github.com/docker/compose/releases/download/v2.29.1/docker-compose-linux-x86_64
	mv docker-compose-linux-x86_64 docker-compose
	sudo chown root:root docker-compose
	sudo chmod +x docker-compose
	sudo mv docker-compose /usr/bin/docker-compose

  echo -e "\n\t${greenColour}[+] Instalación finalizada, añadiendo al usuario: ${yellowColour}$user al grupo Docker${endColour}\n"
  sleep 1.5
  sudo service docker start
  sudo usermod -aG docker $user

  echo -e "\n\t${turquoiseColour}[+] Instalación terminada${endColour}"
  echo -e "\t${grayColour}En 3 segundos se cerrará la sesión, simplemente deberás volver a loguearte :D${endColour}"
  sleep 3

  kill -9 -1
}

if [[ $(id -u) -eq 0 ]]; then
  echo -e "\n\t${redColour}[!] No es necesario ser root para este script ${endColour}"
else
  dockerInstall
fi

