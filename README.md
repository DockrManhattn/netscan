# Netscan
This script automates running scan across multiple hosts and keeps output organized.

# Installation
```bash
chmod +x setup.sh
./setup.sh
```
Requires sudo to check SNMP

# Usage
```bash
netscan 10.10.178.0/24
```

# Example
```bash
┌─[kali@parrot]─[~]
└──╼ $netscan 10.10.178.0/24
Scanning 10.10.178.5
Starting Nmap 7.94SVN ( https://nmap.org ) at 2025-01-07 08:52 EST
Nmap scan report for 10.10.178.5
Host is up.

PORT    STATE         SERVICE
161/udp open|filtered snmp

Nmap done: 1 IP address (1 host up) scanned in 2.19 seconds
Starting Nmap 7.94SVN ( https://nmap.org ) at 2025-01-07 08:52 EST
Nmap scan report for 10.10.178.5
Host is up (0.14s latency).

PORT      STATE    SERVICE          VERSION
53/tcp    filtered domain
88/tcp    filtered kerberos-sec
135/tcp   filtered msrpc
139/tcp   filtered netbios-ssn
389/tcp   open     ldap             Microsoft Windows Active Directory LDAP (Domain: tea.vl0., Site: Default-First-Site-Name)
445/tcp   filtered microsoft-ds
464/tcp   filtered kpasswd5
593/tcp   filtered http-rpc-epmap
636/tcp   filtered ldapssl
3268/tcp  filtered globalcatLDAP
3269/tcp  filtered globalcatLDAPssl
3389/tcp  filtered ms-wbt-server
5985/tcp  filtered wsman
9389/tcp  filtered adws
49664/tcp filtered unknown
49667/tcp open     msrpc            Microsoft Windows RPC
49669/tcp filtered unknown
53441/tcp filtered unknown
53444/tcp filtered unknown
53455/tcp filtered unknown
53460/tcp filtered unknown
Service Info: Host: DC; OS: Windows; CPE: cpe:/o:microsoft:windows

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 97.98 seconds
SMB                      10.10.178.5     445    DC               [*] Windows Server 2022 Build 20348 x64 (name:DC) (domain:tea.vl) (signing:True) (SMBv1:False)
SMB                      10.10.178.5     445    DC               [+] tea.vl\: 
SMB                      10.10.178.5     445    DC               [-] Error enumerating shares: STATUS_ACCESS_DENIED
SMB                      10.10.178.5     445    DC               [*] Windows Server 2022 Build 20348 x64 (name:DC) (domain:tea.vl) (signing:True) (SMBv1:False)
SMB                      10.10.178.5     445    DC               [-] tea.vl\a: STATUS_LOGON_FAILURE
Scanning 10.10.178.6
Starting Nmap 7.94SVN ( https://nmap.org ) at 2025-01-07 08:54 EST
Nmap scan report for 10.10.178.6
Host is up.

PORT    STATE         SERVICE
161/udp open|filtered snmp

Nmap done: 1 IP address (1 host up) scanned in 2.16 seconds
Starting Nmap 7.94SVN ( https://nmap.org ) at 2025-01-07 08:54 EST
Nmap scan report for 10.10.178.6
Host is up (0.14s latency).

PORT      STATE SERVICE       VERSION
80/tcp    open  http          Microsoft IIS httpd 10.0
| http-methods: 
|_  Potentially risky methods: TRACE
|_http-title: IIS Windows Server
|_http-server-header: Microsoft-IIS/10.0
135/tcp   open  msrpc         Microsoft Windows RPC
445/tcp   open  microsoft-ds?
8530/tcp  open  http          Microsoft IIS httpd 10.0
|_http-server-header: Microsoft-IIS/10.0
|_http-title: Site doesn't have a title.
| http-methods: 
|_  Potentially risky methods: TRACE
8531/tcp  open  unknown
49672/tcp open  msrpc         Microsoft Windows RPC
Service Info: OS: Windows; CPE: cpe:/o:microsoft:windows

Host script results:
| smb2-security-mode: 
|   3:1:1: 
|_    Message signing enabled but not required
| smb2-time: 
|   date: 2025-01-07T13:56:00
|_  start_date: N/A

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 97.52 seconds
SMB                      10.10.178.6     445    SRV              [*] Windows Server 2022 Build 20348 x64 (name:SRV) (domain:tea.vl) (signing:False) (SMBv1:False)
SMB                      10.10.178.6     445    SRV              [-] tea.vl\: STATUS_ACCESS_DENIED
SMB                      10.10.178.6     445    SRV              [-] Error enumerating shares: Error occurs while reading from remote(104)
SMB                      10.10.178.6     445    SRV              [*] Windows Server 2022 Build 20348 x64 (name:SRV) (domain:tea.vl) (signing:False) (SMBv1:False)
SMB                      10.10.178.6     445    SRV              [-] tea.vl\a: STATUS_LOGON_FAILURE

┌─[kali@parrot]─[~]
└──╼ $ls -lahR netscan_results/
netscan_results/:
total 4.0K
drwxr-xr-x 1 kali kali  74 Jan  7 09:09 .
drwxr-xr-x 1 kali kali 718 Jan  7 08:48 ..
drwxr-xr-x 1 kali kali  94 Jan  7 08:54 10.10.178.5
drwxr-xr-x 1 kali kali  94 Jan  7 08:56 10.10.178.6
-rw-r--r-- 1 kali kali  66 Jan  7 08:48 netscan-ips.txt

netscan_results/10.10.178.5:
total 12K
drwxr-xr-x 1 kali kali   94 Jan  7 08:54 .
drwxr-xr-x 1 kali kali   74 Jan  7 09:09 ..
-rw-r--r-- 1 root root  308 Jan  7 08:52 001-scan-snmp.md
-rw-r--r-- 1 kali kali 1.3K Jan  7 08:54 002-scan-nmap.md
-rw-r--r-- 1 kali kali  699 Jan  7 08:54 003-scan-nxc.md

netscan_results/10.10.178.6:
total 12K
drwxr-xr-x 1 kali kali   94 Jan  7 08:56 .
drwxr-xr-x 1 kali kali   74 Jan  7 09:09 ..
-rw-r--r-- 1 root root  308 Jan  7 08:54 001-scan-snmp.md
-rw-r--r-- 1 kali kali 1.2K Jan  7 08:56 002-scan-nmap.md
-rw-r--r-- 1 kali kali  747 Jan  7 08:56 003-scan-nxc.md
```
