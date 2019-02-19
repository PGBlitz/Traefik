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
      bash /opt/traefik/tld.sh
      bash /opt/traefik/traefik.sh
      exit ;;
    2 )
      providerinterface
      bash /opt/traefik/traefik.sh
      exit ;;
    3 )
      domaininterface
      bash /opt/traefik/traefik.sh
      exit ;;
    4 )
      emailinterface
      bash /opt/traefik/traefik.sh
      exit ;;
    5 )
      delaycheckinterface
      bash /opt/traefik/traefik.sh
      exit ;;
    a )
      deploytraefik
      bash /opt/traefik/traefik.sh
      exit ;;
    A )
      deploytraefik
      bash /opt/traefik/traefik.sh
      exit ;;
    B )
      destroytraefik
      bash /opt/traefik/traefik.sh
      exit ;;
    b )
      destroytraefik
      bash /opt/traefik/traefik.sh
      exit ;;
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
main /var/plexguide/server.delaycheck 60 delaycheck
main /var/plexguide/server.domain NOT-SET domain
main /var/plexguide/tld.program NOT-SET tld
main /var/plexguide/traefik.deploy 'Not Deployed' deploy

traefikstart
