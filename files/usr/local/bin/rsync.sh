#!/bin/bash

# Svenv.nl rsync backup script
# Creates new backups for fast recovery

# Summary:
# --------
# * Create media backup
# * Create database backup


# Create target directories
ssh -t svenv.nl@recovery.svenv.nl "mkdir -p ~/recovery/etc/letsencrypt/"
ssh -t svenv.nl@recovery.svenv.nl "mkdir -p ~/recovery/srv/nginx/svenv/media/"
ssh -t svenv.nl@recovery.svenv.nl "mkdir -p ~/recovery/srv/postgresql/"


# Create letsencrypt backup (work around 5 certs / 7 days limitation)
rsync -a /etc/letsencrypt/ svenv.nl@recovery.svenv.nl:~/recovery/etc/letsencrypt/


# Create media backup
rsync -a /srv/nginx/svenv/media/ svenv.nl@recovery.svenv.nl:~/recovery/srv/nginx/svenv/media/


# Create database backup
rsync -a /srv/postgresql/ svenv.nl@recovery.svenv.nl:~/recovery/srv/postgresql/
