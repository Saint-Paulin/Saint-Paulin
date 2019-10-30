#!/bin/bash
SUFFIX='dc=paulin,dc=poe'
LDIF=ldapuser.ldif
cat poe-users.csv|while read line
  do
#    read -d, uidNumber fname lname userPassword group < <(echo $line)
    uidNumber=`echo $line | cut -d',' -f1`
    fname=`echo $line | cut -d',' -f2`
    lname=`echo $line | cut -d',' -f3`
    userPassword=`echo $line | cut -d',' -f4`
    group=`echo $line | cut -d',' -f5`
    F_NAME=`echo $fname | head -c 1`
    USER_NAME=`echo $F_NAME$lname`
    echo "I got:$uidNumber|$fname|$lname|$userPassword|$group"
    echo "dn: uid=$USER_NAME,ou=people,$SUFFIX" >> $LDIF
    echo "objectClass: inetOrgPerson" >> $LDIF
    echo "objectClass: posixAccount" >> $LDIF
    echo "objectClass: shadowAccount" >> $LDIF
    echo "sn: $lname" >> $LDIF
    echo "givenName: $USER_NAME" >> $LDIF
    echo "cn: $USER_NAME" >> $LDIF
    echo "displayName: $USER_NAME" >> $LDIF
    echo "uidNumber: $uidNumber" >> $LDIF
    echo "gidNumber: $uidNumber" >> $LDIF
    #echo "userPassword: {crypt}$(grep '${uidNumber}:')" >> $LDIF
    echo "gecos: $USER_NAME" >> $LDIF
    #echo 'loginShell: $(echo "$TARGET_USER")' >> $LDIF
    echo "homeDirectory: $USER_NAME" >> $LDIF
    #echo 'shadowExpire: $(passwd -S "$uidNumber")' >> $LDIF
    #echo "shadowFlag: $SHADOW_FLAG" >> $LDIF
    #echo 'shadowWarning: $(passwd -S "$uidNumber")' >> $LDIF
    #echo 'shadowMin: $(passwd -S "$uidNumber")' >> $LDIF
    #echo 'shadowMax: $(passwd -S "$uidNumber")' >> $LDIF
    #echo "shadowLastChange: $LASTCHANGE_FLAG" >> $LDIF
    echo >> $LDIF
  done
