127.0.0.1 localhost

%{ for index, ip in master_ips }
${ip} master-0
${ip} master-1
${ip} master-2
%{ endfor }


%{ for index, ip in haproxy_ip }
${ip} control.oblivionone.com
%{ endfor }

ff02::1 ip6-allnodes
ff02::2 ip6-allrouters

