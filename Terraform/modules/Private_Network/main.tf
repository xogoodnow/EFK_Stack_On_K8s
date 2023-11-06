resource "hcloud_network" "k8s-internal" {
  name     = "k8s-internal"
  ip_range = "10.0.0.0/8"

}

resource "hcloud_network_subnet" "k8s-internal-network" {
  network_id   = hcloud_network.k8s-internal.id
  type         = "cloud"
  network_zone = "eu-central"
  ip_range     = "10.0.0.0/8"
}