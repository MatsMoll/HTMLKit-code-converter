#!/bin/sh

#  install.sh
#  Safeleaf-generator
#
#  Created by Mats Mollestad on 16/04/2019.
#

swift package resolve
vapor xcode -y
