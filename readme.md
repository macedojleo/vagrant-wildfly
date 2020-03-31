# Installing Vagrant

**Vagrant** is a tool for building and managing virtual machine environments in a single workflow. 
Following the instructions [here](https://www.vagrantup.com/docs/installation/) to install the tool. 

# What is WildFly?

**WildFly** is an application server authored by **JBoss**, written in Java and implements the Java Platform Enterprise Edition (Java EE) specification.

# Starting WildFly VM using vagrant box

1. [Clone](https://github.com/macedojleo/vagrant-wildfly.git) this project
2. Access the project directory
3. Start and provisioning the Virtual Machine
 
 ```$ vagrant up --provosioning ```

 4. Access the VM using:
  
 ```$ vagrant ssh``` 

# Configure WildFly Authentication

Use /opt/wildfly/bin/add-user.sh script to add a new user to connect on the administration console or remotely using the command line CLI

 ``` 
 $ cd /opt/wildfly/bin/
 $ ./add-user.sh
 ```

# Access Administration Console CLI

To access the WildFly Administration Console from the CLI you can use the **/opt/wildfly/bin/jboss-cli.sh** script with the option --connect

 ```
 $ cd /opt/wildfly/bin/
 $ ./jboss-cli.sh --connect
 ```
 
# Access Administration Console GUI

By default, the WildFly administration console is available only from localhost at **http://localhost:9990/console.**
Sign in the console using the user created before.
 
**The WildFly detailed instalation guide is [here](https://linuxize.com/post/how-to-install-wildfly-on-ubuntu-18-04/)**  
