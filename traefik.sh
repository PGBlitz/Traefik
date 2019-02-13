#!/bin/bash
#
# Title:      PlexGuide (Reference Title File)
# Author(s):  Admin9705
# URL:        https://plexguide.com - http://github.plexguide.com
# GNU:        General Public License v3.0
################################################################################
source /opt/traefik/functions.sh

traefikstart() {

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
