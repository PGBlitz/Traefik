#!/bin/bash
#
# Title:      PGBlitz (Reference Title File)
# Author(s):  Admin9705
# URL:        https://pgblitz.com - http://github.pgblitz.com
# GNU:        General Public License v3.0
################################################################################
source /pg/traefik/functions.sh

traefikstart() {

traefikpaths #functions
traefikstatus #functions
layoutbuilder # functions - builds out menu

case $typed in
    1 )
      bash /pg/traefik/tld.sh
      bash /pg/traefik/traefik.sh
      exit ;;
    2 )
      providerinterface
      bash /pg/traefik/traefik.sh
      exit ;;
    3 )
      domaininterface
      bash /pg/traefik/traefik.sh
      exit ;;
    4 )
      emailinterface
      bash /pg/traefik/traefik.sh
      exit ;;
    5 )
      delaycheckinterface
      bash /pg/traefik/traefik.sh
      exit ;;
    a )
      blockdeploycheck
      deploytraefik
      bash /pg/traefik/traefik.sh
      exit ;;
    A )
      blockdeploycheck
      deploytraefik
      bash /pg/traefik/traefik.sh
      exit ;;
    B )
      destroytraefik
      bash /pg/traefik/traefik.sh
      exit ;;
    b )
      destroytraefik
      bash /pg/traefik/traefik.sh
      exit ;;
    z )
      exit ;;
    Z )
      exit ;;
    * )
      traefikstart ;;
esac

}

main /pg/var/traefik.provider NOT-SET provider
main /pg/var/server.email NOT-SET email
main /pg/var/server.delaycheck 60 delaycheck
main /pg/var/server.domain NOT-SET domain
main /pg/var/tld.program NOT-SET tld
main /pg/var/traefik.deploy 'Not Deployed' deploy

traefikstart
