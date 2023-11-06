resource "hcloud_server" "master" {
  count = 3
  name         = "master-${count.index}"
  image        = var.image_name
  server_type  = "cpx31"
  ssh_keys = [data.hcloud_ssh_key.key1.id,data.hcloud_ssh_key.key2.id,data.hcloud_ssh_key.key3.id]
  location = var.location
  network {
    network_id = data.hcloud_network.private-network.id
  }

}



resource "hcloud_server" "haproxy" {
  name         = "haproxy"
  image        = var.image_name
  server_type  = "cx21"
  ssh_keys = [data.hcloud_ssh_key.key1.id,data.hcloud_ssh_key.key2.id,data.hcloud_ssh_key.key3.id]
  location = var.location
  network {
    network_id = data.hcloud_network.private-network.id
  }
}


data "hcloud_network" "private-network" {
  name = "k8s-internal"

}


data "hcloud_ssh_key" "key1"  {
  name = "kang"

}

data "hcloud_ssh_key" "key2"  {
  name = "Kangkey"

}

data "hcloud_ssh_key" "key3" {
  name = "ssh_key_bastion"

}


resource "local_file" "inventory" {
  content = templatefile("${path.module}/inventory.tpl",
    {
      master_ips = hcloud_server.master.*.ipv4_address
      haproxy_ip = hcloud_server.haproxy.ipv4_address
    }
  )
  filename = "${path.module}/../../inventory.yaml"
}



resource "local_file" "etcd-hosts" {
  content  = templatefile("${path.module}/etchost.tpl",
    {
      master_ips = hcloud_server.master.*.ipv4_address
      haproxy_ip = hcloud_server.haproxy.ipv4_address

    }
  )
  filename = "${path.module}/../../Ansible/roles/Pre_Setup/files/etchost.yaml"
}





