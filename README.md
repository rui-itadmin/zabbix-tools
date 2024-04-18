listenport-json.sh 
---
- read listen port from ss and convert it to json with format "PORT":"PORTNUMBER"
- ref: [zabbix doc lld](https://www.zabbix.com/documentation/current/en/manual/discovery/low_level_discovery)

```example
$ ./listenport-json.sh 
[{"{#PORT}":"22"},{"{#PORT}":"80"},{"{#PORT}":"443"},{"{#PORT}":"10050"}]

```

ssl-expire.sh 
---
- put domain in parameter1. ssl-expire.sh will return ssl expire date of https://domain.

```example
$ ./ssl-expire.sh www.google.com
40

```

zabbix-agent.yaml
---
An example of an Ansible playbook to install Zabbix Agent. The action list is as follows:
- install zabbix-agent
- change server ip in zabbix_agentd.conf
- copy listenport-json.sh
- create userparameter
- restart zabbix-agent

