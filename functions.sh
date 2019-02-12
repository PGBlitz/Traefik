#!/bin/bash
#
# Title:      PlexGuide (Reference Title File)
# Author(s):  Admin9705
# URL:        https://plexguide.com - http://github.plexguide.com
# GNU:        General Public License v3.0
################################################################################
main() {
   local file=$1 val=$2 var=$3
   [[ -e $file ]] || printf '%s\n' "$val" > "$file"
   printf -v "$var" '%s' "$(<"$file")"
}

layoutbuilder() {

  pnum=4
  mkdir -p /var/plexguide/prolist
  rm -rf /var/plexguide/prolist/* 1>/dev/null 2>&1

  ls -la "/opt/traefik/providers/$provider" | awk '{print $9}' | tail -n +4 > /var/plexguide/prolist/prolist.sh

  while read p; do
    let "pnum++"
    echo "$p" > "/var/plexguide/prolist/$pnum"
    echo "[$pnum] $p" >> /var/plexguide/prolist/final.sh
  done </var/plexguide/prolist/prolist.sh
  prolist=$(cat /var/plexguide/prolist/final.sh)
  echo $prolist

  #typed2=999999999
  #while [[ "$typed2" -lt "1" || "$typed2" -gt "$pnum" ]]; do
  #  infolist
  #  read -p 'Type Number | Press [ENTER]: ' typed2 < /dev/tty
  #  if [[ "$typed2" == "exit" || "$typed2" == "Exit" || "$typed2" == "EXIT" ]]; then projectinterface; fi
  #done

}

traefikpaths() {
  mkdir -p /var/plexguide/traefik
}

traefikstatus() {
  if [ "$(docker ps --format '{{.Names}}' | grep traefik)" == "traefik" ]; then
    deployed="DEPLOYED"; else deployed="NOT DEPLOYED"; fi
}

uistart1() {
# Menu Interface
tee <<-EOF

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🚀 Traefik - Reverse Proxy Interface Menu
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[1] Top Level Domain App: [$tld]
[2] Domain Provider     : [$provider]
[3] Domain Name         : [$domain]
[4] EMail Address       : [$email]
EOF
}
