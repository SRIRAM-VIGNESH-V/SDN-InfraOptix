# SDNInfraOptix

SDNInfraOptix project focuses on automating the monitoring of SDN infrastructures through the use of network infrastructure management tools. It utilizes data collectors such as Telegraf and Mininet for SDN network emulation, along with InfluxDB for data storage and visualization.

## VM Installation

To set up the virtual machines (VMs) for SDNinfraOptix, follow these steps:

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
```
ryu-manager ryu.app.simple_switch_13 
```
This command launches the Ryu SDN controller, which will serve as the central management entity for the SDN network.

### Start Mininet and Create SDN Topology

Once the SDN controller is running, proceed to start Mininet and create the SDN topology. Run the 'scenario.py' script to achieve this:
```
python scenario.py
```

Executing this script will configure the SDN network topology as defined in 'scenario.py' and open the Mininet Command Line Interface (CLI). From the Mininet CLI, you can interact with the virtual network switches, hosts, and links to simulate various network scenarios.

## Installation Shell Scripts

To streamline the setup process for your SDNinfraOptix project, several shell scripts are provided to automate the installation of essential components. Below are brief explanations of each script:

### install_influxdb.sh

This script automates the installation of InfluxDB, a time-series database used for storing metrics and data collected from SDN network monitoring. InfluxDB is a crucial component for data storage and analysis within SDNinfraOptix. The script ensures the proper installation and configuration of InfluxDB, enabling seamless integration into your SDN environment.

### install_mininet.sh

Mininet is a network emulator that facilitates the creation of virtual SDN networks for testing and development purposes. The install_mininet.sh script automates the installation of Mininet, along with any necessary dependencies. By running this script, you can quickly set up a virtual SDN environment on your system, allowing for experimentation and testing of SDNinfraOptix monitoring tools.

### install_ryu.sh

Ryu is an open-source SDN controller that provides a framework for building SDN applications. The install_ryu.sh script automates the installation of the Ryu SDN controller, ensuring it is properly configured and ready for use. With Ryu installed, you can deploy custom SDN applications and manage network traffic efficiently within your SDNinfraOptix environment.

## SDN Scenario Setup with Mininet

The `scenario_basic.py` script sets up a basic Software-Defined Networking (SDN) scenario using the Mininet network emulator. Here's what it does:

### Network Topology Configuration

- Defines a network topology with three switches (s1, s2, s3) and six hosts (h1 to h6).
- Establishes links between switches and hosts, specifying bandwidth and maximum queue size for each link.

### Controller Setup

- Adds a RemoteController named c0 with a specified IP address, protocol, and port.

### Controller and Switch Activation

- Starts the controller and sets controllers for switches.

### Telegraf Integration

- Launches Telegraf on one of the hosts (h4) to enable network monitoring.

### Mininet Command Line Interface (CLI)

- Opens the Mininet CLI, allowing users to interact with the configured network.

This script provides a foundational setup for SDN experimentation and testing. Users can modify the script to create more complex network topologies and integrate additional functionalities as needed.

## Telegraf

Telegraf is a lightweight agent designed for collecting, processing, and forwarding metrics in various environments. In the context of networking devices, Telegraf plays a crucial role in gathering performance data such as bandwidth usage, CPU load, and memory usage.

### Telegraf Daemon

The Telegraf daemon serves as the background process of Telegraf, operating continuously to collect, process, and transmit metrics from diverse sources to specified destinations. Its modular design facilitates seamless integration with different devices and protocols, making it a versatile solution for monitoring network health.

### Integration with SDNinfraOptix
![image](https://github.com/SRIRAM-VIGNESH-V/SDNInfraOptix/assets/159048515/790a5d6e-bcb8-4267-acd3-35d57ae24e0a)


In the SDNinfraOptix project, Telegraf is utilized to monitor the network performance within the SDN environment. The architecture involves running Telegraf instances on Mininet hosts and the host VM, facilitating the collection and transmission of metrics to InfluxDB for analysis and visualization.

### Architecture Overview

#### Mininet Host (Host 4)

- Telegraf is installed and configured on Mininet's Host 4 to gather data.
- The output of this Telegraf instance is directed to a file located in the VM's home directory.

#### Host VM

- Another Telegraf instance is run on the host VM.
- This Telegraf instance serves as a proxy, receiving input from the file generated by Mininet's Host 4.
- Its output is directed to the InfluxDB hosted on the controller VM.

### Architecture Rationale

This architecture leverages the shared filesystem between Mininet hosts and the host VM. By employing a second Telegraf instance as a proxy, communication between Mininet's internal hosts and the controller VM is facilitated, despite residing in separate networks.

### Benefits

- Real-time monitoring and analysis of network performance are enabled through Telegraf's ability to output data to databases like InfluxDB.
- Visualization of collected metrics can be achieved using tools such as Grafana, providing insights into network health and performance trends.

### Interface telegraph to InfluxDB
Official documentation :
https://docs.influxdata.com/influxdb/v2/write-data/no-code/use-telegraf/

## License:
MIT License Github
