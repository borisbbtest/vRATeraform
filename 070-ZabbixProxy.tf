resource "vsphere_virtual_machine" "ZabbixProxy" {
  name             = "${var.source_pfx}-ZabbixProxy-${count.index}"
  num_cpus         = var.zadbixproxy_vm_params["vcpu"]
  count = 2
  memory           = var.zadbixproxy_vm_params["ram"]
  datastore_id     = data.vsphere_datastore.datastore.id
  //host_system_id   = data.vsphere_host.host.id
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  guest_id         = data.vsphere_virtual_machine.template.guest_id
  scsi_type        = data.vsphere_virtual_machine.template.scsi_type
  folder = "/Monitoring/AutoDeploy/ZabbixProxy"

  # Set network parameters
  network_interface {
    network_id = data.vsphere_network.network.id
  }


  # Use a predefined vmware template has main disk
  disk {
    label = "disk0"
    size = var.zadbixproxy_vm_params["disk_size"]
    thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id

    customize {
      linux_options {
        host_name = "${var.source_pfx}-${var.zadbixproxy_hostname}${count.index}"
        domain    = var.network_params["domain"]
      }

      network_interface {
        ipv4_address    = "${var.network_params["based_ip"]}${var.zadbixproxy_ipaddress[count.index]}"
        ipv4_netmask    =  var.network_params["prefix_length"]
      }
      dns_server_list = var.dns_servers
      dns_suffix_list = var.dns_suffix
      ipv4_gateway = var.network_params["gateway"]
    }
  }

  # Execute script on remote vm after this creation
  # Execute script on remote vm after this creation
  provisioner "remote-exec" {
     script = "scripts/example-script.sh"
     connection {
       type     = "ssh"
       user     = "root"
       password = "P@ssw0rd"
       host     = "${var.network_params["based_ip"]}${var.zadbixproxy_ipaddress[count.index]}"
     }
   }
}
