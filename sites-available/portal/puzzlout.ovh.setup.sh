#!/bin/bash
vDomain="puzzlout.ovh"
vUser="puzzlout"

#Install of Portal on puzzlout.ovh"
echo "Install of Portal on $vDomain"
bash vps-manager/sites-available/common/puzzlout.portal.setup.sh $vDomain $vUser
