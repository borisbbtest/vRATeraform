data "vsphere_datacenter" "dc" {
  name = var.dc
}

data "vsphere_compute_cluster" "cluster" {
  name          = var.cluster
  datacenter_id = data.vsphere_datacenter.dc.id
}

# Retrieve datastore information on vsphere
data "vsphere_datastore" "datastore" {
  name          = var.datastore
  datacenter_id = data.vsphere_datacenter.dc.id
}

# Retrieve network information on vsphere
data "vsphere_network" "network" {
  name          = var.vswitch
  datacenter_id = data.vsphere_datacenter.dc.id
}

# Retrieve template information on vsphere
data "vsphere_virtual_machine" "template" {
  name          = var.template_image
  datacenter_id = data.vsphere_datacenter.dc.id
}
