#!/bin/bash

########################################################################################################
# ./module-symlink.sh /web/ui-commons/src/component/oafe /web/commons-view-components/web-cvc-testapp  #
########################################################################################################

Source=${1%/}
Dest=${2%/}

# extract module full path from the source directory
ModuleName=${Source##*/}
Temp=${Source%/*}
ModuleParentDir=${Temp##*/}
ModuleFqn=$ModuleParentDir/$ModuleName

# extract application name from destination
AppName=${Dest##*/}

Assets=('css' 'js' 'templates')
NumElements=${#Assets[@]}

for (( i=0; i < $NumElements; i++)); do
  echo -e "\nmkdir -p $Dest/public/${Assets[${i}]}/$AppName/$ModuleFqn"
  echo -e "ln -sf $Source/${Assets[${i}]}/* $Dest/public/${Assets[${i}]}/$AppName/$ModuleFqn/"

  mkdir -p $Dest/public/${Assets[${i}]}/$AppName/$ModuleFqn
  ln -sf $Source/${Assets[${i}]}/* $Dest/public/${Assets[${i}]}/$AppName/$ModuleFqn/
done

echo -e "\nSimlinks complete.\n"