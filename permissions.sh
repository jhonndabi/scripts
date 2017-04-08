#!/bin/bash

find . -type d -exec chmod 0755 {} \;
find . -type f -exec chmod 0644 {} \;
find . -exec chown www-data {} \;
find . -exec chgrp $USER {} \;

#TODO Custom Data // receive from input the values (Permissions/User/Group)