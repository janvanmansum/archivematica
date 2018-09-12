#!/usr/bin/env bash

SUPER_NAME=$1
SUPER_EMAIL=$2
SUPER_PASSWORD=$3

set -a -e -x
source /etc/default/archivematica-storage-service || \
  source /etc/sysconfig/archivematica-storage-service \
  || (echo 'Environment file not found'; exit 1)
cd /usr/lib/archivematica/storage-service
echo "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.create_superuser('$SUPER_NAME', '$SUPER_EMAIL', '$SUPER_PASSWORD')" | \
    /usr/share/archivematica/virtualenvs/archivematica-storage-service/bin/python manage.py shell
