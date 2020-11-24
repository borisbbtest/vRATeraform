provider "vsphere" {
  # If you use a domain set your login like this "MyDomain\\MyUser"
  user           = "administrator@vsphere.local"
  password       = "GHb19ds!vC2z"
  //vsphere_server = "vcsa-02.zonmonitoring.local"
  vsphere_server = "172.16.62.250"
  # if you have a self-signed cert
  allow_unverified_ssl = true
}

#### TEMPLATES

# You must add template in vsphere before use it
variable "template_image" {
  default = "vmCentOS8"
}

#### DC AND CLUSTER
# Set vpshere datacenter
variable "dc" {
  default = "ZonmonitoringDC"
}

# Set cluster where you want deploy your vm
variable "cluster" {
  default = "Cluster02"
}

variable "datastore" {
  default = "DS-10TB"
}


#### GLOBAL NETWORK PARAMS
variable "vswitch" {
  default = "Acad_monitoring"
}

variable "dns_servers" {
  default = ["172.16.61.5", "172.16.61.6"]
}
variable "dns_suffix" {
  default = ["acad.local"]
}
variable "source_pfx" {
  default="712b"
}
variable "network_params" {
  default = {
    domain        = "acad.local"
    prefix_length = 24
    based_ip= "172.16.62."
    gateway       = "172.16.62.1"
  }
}


#### Grafana config #####################################

variable "grafana_vm_params" {
  default = {
    vcpu = "2"
    ram  = "4096"
    disk_size  = "60"
  }
}
variable "grafana_ipaddress" {
  default = "131"
}

variable "grafana_hostname" {
  default = "grafana"
}

#### Zabbix #####################################

variable "zabbix_vm_params" {
  default = {
    vcpu = "2"
    ram  = "4096"
    disk_size  = "60"
  }
}
variable "zabbix_ipaddress" {
  default = "132"
}

variable "zabbix_hostname" {
  default = "zabbix"
}


#### ZabbixDB_PostgresMaster #####################################

variable "zabbixdbm_vm_params" {
  default = {
    vcpu = "2"
    ram  = "4096"
    disk_size  = "60"
    db=300
  }
}
variable "zabbixdbm_ipaddress" {
  default = "133"
}

variable "zabbixdbm_hostname" {
  default = "zabbixdbm10"
}

#### ZabbixDB_PostgresSlave #####################################

variable "zabbixdbs_vm_params" {
  default = {
    vcpu = "2"
    ram  = "4096"
    disk_size  = "60"
    db=300
  }
}
variable "zabbixdbs_ipaddress" {
  default = ["134","135"]
}

variable "zabbixdbs_hostname" {
  default = "zabbixdbs"
}

#### ZabbixDB_PostgresWitness #####################################

variable "zabbixdbwitness_vm_params" {
  default = {
    vcpu = "2"
    ram  = "4096"
    disk_size  = "60"
  }
}
variable "zabbixdbwitness_ipaddress" {
  default = "136"
}

variable "zabbixdbwitness_hostname" {
  default = "zabbixdbwitness20"
}


#### Zabbix Proxy #####################################

variable "zadbixproxy_vm_params" {
  default = {
    vcpu = "2"
    ram  = "4096"
    disk_size  = 120
  }
}
variable "zadbixproxy_ipaddress" {
  default = ["137","138"]
}

variable "zadbixproxy_hostname" {
  default = "zadbixproxy"
}


#### vRLi NFS #####################################

variable "vrlinfs_vm_params" {
  default = {
    vcpu = "2"
    ram  = "4096"
    disk_size  = "60"
    db=300
  }
}
variable "vrlinfs_ipaddress" {
  default = "139"
}

variable "vrlinfs_hostname" {
  default = "vrli-nfs"
}