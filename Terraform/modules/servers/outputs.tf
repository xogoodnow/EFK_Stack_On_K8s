output "master_ips" {
  value = hcloud_server.master[*].ipv4_address
}

output "haproxy_ips" {
  value = hcloud_server.haproxy[*].ipv4_address
}




output "master_private_ips" {
  value = hcloud_server.master[*].network[*].ip
}

output "haproxy_private_ips" {
  value = hcloud_server.haproxy[*].network[*].ip
}


