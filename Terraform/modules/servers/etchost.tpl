127.0.0.1 localhost

%{ for index, ip in master_ips }
${ip} master-${index}
%{ endfor }


${haproxy_ip} control.oblivionone.com


ff02::1 ip6-allnodes
ff02::2 ip6-allrouters

