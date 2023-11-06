
data "hcloud_server" "master" {
  count = 3
  name = "master-${count.index}"

}

resource "hcloud_volume" "master_volumes" {
  count = length(data.hcloud_server.master)
  name  = "master-${count.index}-volume"
  size  = 200
  server_id = data.hcloud_server.master[count.index].id
}