#!/bin/bash
set -eo pipefail

run() {
  firefox -CreateProfile default
  sudo dpkg -i /warsaw_setup64.deb
  su -c "/etc/init.d/warsaw start"
  /usr/local/bin/warsaw/core
  firefox --private-window $1
}

case ${1} in
  itau)
    run "http://www.itau.com.br"
  ;;
  bb)
    run "https://www2.bancobrasil.com.br/aapf/login.jsp?aapf.IDH=sim&perfil=1"
  ;;
  bbpj)
    run "https://aapj.bb.com.br/aapj/loginpfe.bb"
  ;;
  cef)
    run "https://internetbanking.caixa.gov.br/sinbc/#!nb/login"
  ;;
  sobre|about|ajuda|help)
    run "https://github.com/lichti/containers4docker/tree/master/warsaw-browser"
  ;;
  *)
    run "http://www.dieboldnixdorf.com.br/warsaw"
  ;;
esac

exit 0

