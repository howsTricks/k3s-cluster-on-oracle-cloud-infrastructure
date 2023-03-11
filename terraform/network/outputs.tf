output "vcn" {
  description = "Created VCN"
  value       = oci_core_vcn.cluster_network
}

output "cluster_subnet" {
  description = "Subnet of the k3s cluser"
  value       = oci_core_subnet.cluster_subnet
  depends_on  = [oci_core_subnet.cluster_subnet]
}

output "permit_ssh_output" {
  description = "IPs allowed to ssh"
  value       = oci_core_network_security_group_security_rule.permit_ssh.source
}

output "ad" {
  value = data.oci_identity_availability_domain.ad.name
}
