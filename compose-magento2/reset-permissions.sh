#!/bin/bash

USER_NAME=$1
GROUP_NAME=$2
WRITABLE_FOLDERS='www/var www/pub/static www/pub/media www/app/etc'

if [ -z "$GROUP_NAME" ]; then
	GROUP_NAME='www-data'
fi

# Reset standard permissions on all directories and files
if [ ! -z "$USER_NAME" ]; then
    chown -R $USER_NAME:$USER_NAME www
fi
find www -type d -exec chmod 755 {} \;
find www -type f -exec chmod 644 {} \;

# Set magento specific permissions
chgrp -R $GROUP_NAME $WRITABLE_FOLDERS
chmod -R g+w $WRITABLE_FOLDERS
chmod u+x www/bin/magento

