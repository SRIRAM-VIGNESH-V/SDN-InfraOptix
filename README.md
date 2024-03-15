# SDNInfraOptix

SDNInfraOptix focuses on automating the monitoring of SDN infrastructures through the use of network infrastructure management tools. It utilizes data collectors such as Telegraf and Mininet for SDN network emulation, along with InfluxDB for data storage and visualization.

## VM Installation

To set up the virtual machines (VMs) for your SDNinfraOptix project, follow these steps:

### Execute the 'vagrant.conf' File

The 'vagrant.conf' file contains configuration settings for provisioning the VMs. Before starting the VMs, it's essential to execute this file. Ensure that you allocate sufficient memory for the VMs in the configuration.

### Start the VMs

Once the 'vagrant.conf' file is executed and memory allocation is ensured, use the command `vagrant up` to start the VMs. This command reads the configuration from the 'Vagrantfile' and initializes the VMs accordingly.

### Accessing VMs with SSH

After the VMs are up and running, you may need to access them for various purposes. For root shell access to specific VMs, utilize the following commands:

- `vagrant ssh test`: This command grants access to the 'test' VM, allowing you to interact with its shell environment.
- `vagrant ssh controller`: Use this command to access the 'controller' VM, enabling you to perform administrative tasks and configuration changes as needed.

## Creating SDN

To establish the Software-Defined Networking (SDN) environment, follow these steps:

### Start the SDN Controller

On VM1, initiate the SDN controller using the following command:
''' ryu-manager ryu.app.simple_switch_13 '''

