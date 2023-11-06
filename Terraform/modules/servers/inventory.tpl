all:
    children:
        kang:
            hosts:
            %{ for index, ip in master_ips }
                master-hel-${index}:
                    ansible_host: ${ip}
                    ansible_user: root
                    mode: 'master'
                    init_master: ${index == 0 ? "'true'" : "'false'"}
            %{ endfor }

                haproxy:
                    ansible_host: ${haproxy_ip}
                    ansible_user: root
                    mode: 'haproxy'
                    init_master: 'false'