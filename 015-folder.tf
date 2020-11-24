# resource "vsphere_folder" "vRLiNFS" {
#   path          = "/Monitoring/AutoDeploy/vRLiNFS"
#   type          = "vm"
#   datacenter_id = data.vsphere_datacenter.dc.id
# }

# resource "vsphere_folder" "Grafana" {
#   path          = "/Monitoring/AutoDeploy/Grafana"
#   type          = "vm"
#   datacenter_id = data.vsphere_datacenter.dc.id
# }

# resource "vsphere_folder" "Zabbix" {
#   path          = "/Monitoring/AutoDeploy/Zabbix"
#   type          = "vm"
#   datacenter_id = data.vsphere_datacenter.dc.id
# }

# resource "vsphere_folder" "Zabbixdb" {
#   path          = "/Monitoring/AutoDeploy/Zabbixdb"
#   type          = "vm"
#   datacenter_id = data.vsphere_datacenter.dc.id
# }

# resource "vsphere_folder" "ZabbixProxy" {
#   path          = "/Monitoring/AutoDeploy/ZabbixProxy"
#   type          = "vm"
#   datacenter_id = data.vsphere_datacenter.dc.id
# }