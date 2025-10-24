#!/bin/bash

echo "== System Uptime =="
uptime

echo -e "\n== CPU Usage =="
top -b -n 1 | head -n 5

echo -e "\n== Memory Usage =="
free -h

echo -e "\n== Disk Usage =="
df -h

echo -e "\n== Top Processes =="
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head

echo -e "\n== Running Critical Services =="
systemctl status nginx | head -n 10      # Example: Replace 'nginx' with your service
systemctl status sshd | head -n 10       # Check SSH service

echo -e "\n== Network Status =="
ip a
ss -tuln

echo -e "\n== Last 10 Auth Logins =="
last -n 10

echo -e "\n== System Logs (critical errors) =="
journalctl -p 3 -xb | tail -n 10

# Uncomment below to email results (needs 'mailx' or 'mail' configured)
# mailx -s "Daily Linux System Health" your_email@example.com < /tmp/system_report.txt

