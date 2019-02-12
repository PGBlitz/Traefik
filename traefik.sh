#!/bin/bash
#
# Title:      PlexGuide (Reference Title File)
# Author(s):  Admin9705
# URL:        https://plexguide.com - http://github.plexguide.com
# GNU:        General Public License v3.0
################################################################################
source /opt/traefik/functions.sh
source /opt/traefik/ui.sh

traefikstart() {

traefikpaths #functions
traefikstatus #functions

if [[ "$provider" == "NOT-SET" ]]; then layout=" "; fi
tee <<-EOF

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🚀 Traefik - Reverse Proxy Interface Menu
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[1] Top Level Domain App: [$tld]
[2] Domain Provider     : [$provider]
[3] Domain Name         : [$domain]
[4] EMail Address       : [$email]
EOF
layoutbuilder
tee <<-EOF
[A] Deploy Traefik      : [$deployed]
[Z] Exit

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
EOF

# Standby
read -p 'Type a Number | Press [ENTER]: ' typed < /dev/tty

case $typed in
    1 )
      traefikstart ;;
    2 )
      uiprovider
      traefikstart ;;
    3 )

      traefikstart ;;
    4 )
      traefikstart ;;
    5 )

      traefikstart ;;
    z )
      exit ;;
    Z )
      exit ;;
    * )
      primestart ;;
esac

}

main /var/plexguide/traefik.provider NOT-SET provider
main /var/plexguide/server.email NOT-SET email
main /var/plexguide/server.domain NOT-SET domain
main /var/plexguide/tld.program NOT-SET tld
main /var/plexguide/traefik.deploy 'Not Deployed' deploy

traefikstart
