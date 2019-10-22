#!/bin/bash

set -e

if ! grep -q 'pam_tid.so' /etc/pam.d/sudo;
then
  echo "--> Enabling TouchID for sudo"
  sudo perl -pi -e '$_ .= qq(auth       sufficient     pam_tid.so\n) if /auth       sufficient     pam_smartcard.so/' /etc/pam.d/sudo
fi
