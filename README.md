This provides monitoring for LSI physical and virtual drives.
There are two templates:
  - Template Server LSI RAID - provides only check for VD's status (is there any not optimal VD's);
  - Template Server LSI RAID 2 - provides discovery rules fir VD's and PD's with next items:
    - VD status;
    - PD firmware state;
    - PD predictive failure status;
    - PD SMART alert.

  All items have a trigger.

Installation steps.

1. Install storcli (perccli for DELL).
2. Place import templates from 'lsi.xml'.
3. Place 'userparameter.lsi.conf' to '/etc/zabbix/zabbix-agent.d/'.
4. Place folder 'lsi' to '/opt'.
