output "permit_ssh" {
  value = module.network.permit_ssh_output
}


output "server_0_public_ip" {
  value = module.compute.server_0_public_ip
}
