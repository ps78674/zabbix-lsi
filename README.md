This provides monitoring for LSI physical and virtual drives.
There are two templates:
  - Template Server LSI RAID - provides only check for VD's status (is there any not optimal VD's);
  - Template Server LSI RAID 2 - provides discovery rules for VD's and PD's with next items:
    - VD status;
    - PD firmware state;
    - PD predictive failure status;
    - PD SMART alert.

  All items have a trigger.

Installation steps.

1. Install storcli (perccli for DELL).
2. Import templates from 'lsi.xml'.
3. Place 'userparameter.lsi.conf' to '/etc/zabbix/zabbix-agent.d/'.
4. Place folder 'lsi' to '/opt'.

SELinux - I suggest to create a module (senenforce 0, then check audit.log for messages and create module, like '''cat /var/log/audit/audit.log | grep denied | audit2allow -M zabbix_agent_01 && semodule -i zabbix_agent_01.pp''').

If you using it for DELL PERC monitoring (with perccli), don;t forget to change storcli to perccli in scripts.
