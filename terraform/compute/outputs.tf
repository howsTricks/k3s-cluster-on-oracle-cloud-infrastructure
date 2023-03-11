output "ad" {
  value = data.oci_identity_availability_domain.ad_1.name
}

output "server_0_public_ip" {
  value = oci_core_instance.server_0.public_ip
}
