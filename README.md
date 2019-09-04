## This provides monitoring for LSI physical and virtual drives.
There are two templates:
  - Template Server LSI RAID - provides only check for VD's status (is there any VD with 'Degraded' state);
  - Template Server LSI RAID 2 - provides discovery rules for VD's / PD's with following items:
    - VD status;
    - PD firmware state;
    - PD predictive failure status;
    - PD SMART alert.

  Each item have a trigger.


### Installation steps.

1. Install storcli (perccli for DELL).
2. Import templates from 'lsi.xml'.
3. Copy 'userparameter.lsi.conf' to '/etc/zabbix/zabbix-agent.d/'.
4. Copy all scripts from 'lsi' to '/opt/zabbix/lsi/'.
5. Copy 'storcli' to '/etc/sudoers.d/'.


SELinux - check for avc messages and create a module.

   ```
   setenforce 0
   cat /var/log/audit/audit.log | grep denied | grep zabbix_agent | audit2allow -M zabbix_agent_01
   semodule -i zabbix_agent_01.pp
   ```

For DELL PERC - change command path in 'storcli' and '.config'.
