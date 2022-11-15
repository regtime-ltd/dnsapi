#!/usr/bin/env sh
API_KEY="YOUR_API_KEY_HERE"
API="https://www.webnames.ru/scripts/json_domain_zone_manager.pl"
#CREATE_DOMAIN="_acme-challenge.$CERTBOT_DOMAIN"
#PARAMS="apikey=$API_KEY&domain=$CERTBOT_DOMAIN&type=TXT&record=$CREATE_DOMAIN:$CERTBOT_VALIDATION"

dns_webnames_add() {
  fulldomain=$1
  txtvalue=$2
  _info "Using webnames"
  _debug fulldomain "$fulldomain"
  _debug txtvalue "$txtvalue"
  _debug "First detect the root zone"
  _get_root "$fulldomain"
#  _err "Not implemented!"
    PARAMS="apikey=$API_KEY&domain=$domain&type=TXT&record=$subdomain:$txtvalue&action=add"
    _post $PARAMS $API
  return 0
}

#Usage: fulldomain txtvalue
#Remove the txt record after validation.
dns_webnames_rm() {
  fulldomain=$1
  txtvalue=$2
  _info "Using webnames"
  _debug fulldomain "$fulldomain"
  _debug txtvalue "$txtvalue"
  _get_root "$fulldomain"
  PARAMS="apikey=$API_KEY&domain=$domain&type=TXT&record=$subdomain:$txtvalue&action=delete"
    _post $PARAMS $API
}

####################  Private functions below ##################################
#_acme-challenge.www.domain.com
#returns
# _sub_domain=_acme-challenge.www
# _domain=domain.com
# _domain_id=sdjkglgdfewsdfg
_get_root() {
  domain=$(echo $1 | awk -F"." '{print $(NF-1) "." $(NF)}') #'
  replace="s/.$domain//g"
  subdomain=$(echo $1|sed $replace)
}
