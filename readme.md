# Starting VM using vagrant box

- Access the project directory
- Start and provisioning VM
 
 $ vagrant up --provosioning

 - Access the VM using:
  
 $ vagrant ssh 

# Configure WildFly Authentication

 - Use /opt/wildfly/bin/add-user.sh to add a new user to connect on the administration console or remotely using the CLI

 $ cd /opt/wildfly/bin/
 $ ./add-user.sh

# Access Administration Console CLI

 - To access the WildFly Administration Console from the command line you can use the /opt/wildfly/bin/jboss-cli.sh script using the option --connect

 $ cd /opt/wildfly/bin/
 $ ./jboss-cli.sh --connect

# Access Administration Console GUI

- By default, the WildFly administration console is available only from localhost at http://localhost:9990/console.
- Sign in using the user created before.
 
### source: https://linuxize.com/post/how-to-install-wildfly-on-ubuntu-18-04/  
