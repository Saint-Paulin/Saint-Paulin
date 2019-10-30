#!/bin/bash
cd /mnt/backup
tar cvf $HOSTNAME-$(date +%y-%m-%d)-etc.tar.gz /etc && logger -t SauvScript Sauvegarde réussie le $(date +%y/%m/%d) dans /mnt/backup
cd