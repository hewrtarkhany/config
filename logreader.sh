#!/bin/sh

awk -F'[][ :-]' '
/upgrade$/ {
   last = mktime($2 " " $3 " " $4 " " $5 " " $6 " 00")
}
END {
   s = systime() - last;
   d = int(s / 86400);
   h = int((s - d * 86400) / 3600)
   m = int((s - d * 86400 - h * 3600) / 60)
   printf "Last update was %d days %d hours and %d minutes ago\nRun pacman now!\n", d, h, m
}
' /var/log/pacman.log
