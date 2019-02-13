#!/bin/bash
#
# Title:      PlexGuide (Reference Title File)
# Author(s):  Admin9705
# URL:        https://plexguide.com - http://github.plexguide.com
# GNU:        General Public License v3.0
################################################################################
source /opt/traefik/functions.sh

traefikstart() {

# Remove Deploy Block Deploy When Startups - Regenerates if Conditions Not Met
file="/var/plexguide/traefik/block.deploy"
if [ -e "$file" ]; then rm -rf /var/plexguide/traefik/block.deploy ; fi

traefikpaths #functions
traefikstatus #functions
layoutbuilder # functions - builds out menu

case $typed in
    1 )
      traefikstart ;;
    2 )
      providerinterface
      traefikstart ;;
    3 )

      traefikstart ;;
    4 )
      traefikstart ;;
    5 )

      traefikstart ;;
    a )
      file="/var/plexguide/traefik/block.deploy"
      if [ -e "$file" ]; then read -p 'Blocking! Must Configure Everything! | Press [ENTER]' typed < /dev/tty; fi
      traefikstart ;;
    A )
        ;;

    z )
      exit ;;
    Z )
      exit ;;
    * )
      traefikstart ;;
esac

}

main /var/plexguide/traefik.provider NOT-SET provider
main /var/plexguide/server.email NOT-SET email
main /var/plexguide/server.domain NOT-SET domain
main /var/plexguide/tld.program NOT-SET tld
main /var/plexguide/traefik.deploy 'Not Deployed' deploy

traefikstart
