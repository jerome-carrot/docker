#!/bin/bash

USER_NAME=$1
GROUP_NAME=$2

if [ -z "$GROUP_NAME" ]; then
	GROUP_NAME=www-data
fi

# Reset standard permissions on all directories and files
if [ ! -z "$USER_NAME" ]; then
    chown -R $USER_NAME:$USER_NAME www
fi
find www -type d -exec chmod 755 {} \;
find www -type f -exec chmod 644 {} \;

# Set magento specific permissions
chgrp -R $GROUP_NAME www/app/etc www/media www/var
chmod -R g+w www/app/etc www/media www/var

