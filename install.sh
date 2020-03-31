#!/bin/bash

conf_folder=$1
WILDFLY_VERSION=$2
tmp_folder=/tmp

print_help() {
	  echo "Usage: $0 conf_folder"
  }

print_message() {

    if [ -z "$1" -o -z "$2" ]; then
       msg_type="INFO"
       msg_text="NO MESSAGE"
    else       
      msg_type=$1
      msg_text=$2
    fi
    
    msg_date=`date +%F`

    echo "$msg_date | $msg_type | $msg_text"

  }

  if [ -z "$conf_folder" ]; then
	    print_help
	      exit 1
      fi

 # jdk install

      print_message "INFO" "Installing JDK"
      sudo apt-get update
      sudo apt-get install -y default-jdk

 # install Wildfly
      print_message "INFO" "Installing WildFly JBOSS"
      cd $tmp_folder

      sudo wget -q https://download.jboss.org/wildfly/$WILDFLY_VERSION/wildfly-$WILDFLY_VERSION.tar.gz -P /tmp
      sudo tar -xf /tmp/wildfly-$WILDFLY_VERSION.tar.gz -C /opt/
      sudo ln -s /opt/wildfly-$WILDFLY_VERSION /opt/wildfly

 # create group and user and change the directory owner to the wildfly
      print_message "INFO" "Creating group WildFly" 
      sudo groupadd -r wildfly
      print_message "INFO" "Creating WildFly user"
      sudo useradd -r -g wildfly -d /opt/wildfly -s /sbin/nologin wildfly
      print_message "INFO" "Changing /opt/WildFly path owner to wildfly user"
      sudo chown -RH wildfly: /opt/wildfly

 # creating a directory which will hold the WildFly configuration file:

      print_message "INFO" "Creating the WildFly configuration dir" 
      sudo mkdir -p /etc/wildfly

      print_message "INFO" "Moving the WildFly configuration file and launch script"
      
      sudo cp $conf_folder/wildfly.conf /etc/wildfly/wildfly.conf
      sudo cp $conf_folder/launch.sh /opt/wildfly/bin/launch.sh

      print_message "INFO" "Creating the /var/run/wildfly directory and set correct permissions" 
      
      sudo mkdir /var/run/wildfly/
      sudo chown wildfly: /var/run/wildfly/

      print_message "INFO" "Setting execute permisions to *.sh scipts on /opt/wildfly/bin/" 
      sudo chmod +x /opt/wildfly/bin/*.sh

 # config systemd
      print_message "INFO" "Setting WildFly at systemctl"
      
      sudo cp $conf_folder/wildfly.service /etc/systemd/system/wildfly.service
      sudo systemctl daemon-reload
      sudo systemctl enable wildfly
      sudo systemctl start wildfly
