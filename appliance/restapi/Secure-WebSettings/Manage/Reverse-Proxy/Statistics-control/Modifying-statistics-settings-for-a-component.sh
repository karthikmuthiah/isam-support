#!/bin/sh
[ "$DEBUG" ] && set -x

appliance_hostname=$1
username=$2
if [ "$3" = "?" ];
then
  echo -n Password: 
  read -s password
  echo ""
else
  password=$3
fi
instance_id=$4
component_id=$5

[ "$CURL" ]  || CURL="curl -s -k -u "$username:$password""

${CURL} -H "Accept: application/json" --data-ascii @modify.json -X PUT https://${appliance_hostname}/wga/reverseproxy/${instance_id}/statistics/${component_id}

exit $?
