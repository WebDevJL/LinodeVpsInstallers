#!/bin/bash
vDomain="puzzlout.com"

#Install of Portal on puzzlout.com"
echo "Install of Portal on $vDomain"
bash vps-manager/sites-available/common/puzzlout.portal.setup.sh $vDomain
