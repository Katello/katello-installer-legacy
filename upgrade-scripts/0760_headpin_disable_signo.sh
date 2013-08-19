#!/bin/bash

#name: Disable Signo SSO in Headpin
#apply: headpin
#run: always
#description:
#This step forces the single sign-on authentication, Signo, off

sed -i '/  sso:/{
N
s/  sso:\n    enable: true/  sso:\n    enable: false/
}' /etc/katello/katello.yml
ret_code=$?

exit $ret_code
