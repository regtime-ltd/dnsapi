# dnsapi

DNS API for acme.sh

Install and renew Let's encrypt wildcard ssl certificate for domain *.domain.tld using Webnames.ru:

## 1. Clone this repo
```
git clone https://github.com/regtime-ltd/dnsapi/ && cd ./dnsapi
```
## 2. Set API KEY
Get your Webnames.ru API key in zone manage domain.
```
nano ./config.sh
```
## 3. Generate wildcard
```
./acme.sh --issue --dns dns_webnames -d "*.domain.tld" -d domain.tld
```
## 4. Howto API key

API KEY можно найти в разделе "Личный кабинет" / "Мои домены и услуги" / "Управление доменом"(по интересующему домену) / "Управление зоной"(домен должен быть делегирован на DNS регистратора ns1.nameself.com; ns2.nameself.com) / "Настройка Acme.sh" (внизу страницы)
