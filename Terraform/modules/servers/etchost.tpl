127.0.0.1 localhost
${join(" ", master_0_private_ips)} master-0
${join(" ", master_1_private_ips)} master-1
${join(" ", master_2_private_ips)} master-2

${join(" ", haproxy_private_ips)} control.oblivionone.com

ff02::1 ip6-allnodes
ff02::2 ip6-allrouters

