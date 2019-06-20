output "public_ip" {
  value = module.network.eip_public_ip
}

output "public_dns" {
  value = module.network.eip_public_dns
}