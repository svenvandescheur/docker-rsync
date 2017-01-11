#!/bin/bash

# Svenv.nl rsync backup script
# Creates new backups for fast recovery

# Summary:
# --------
# * Create target directories
# * Create letsencrypt backup (work around 5 certs / 7 days limitation)
# * Create media backup
# * Create database backup


# Create target directories
ssh svenv.nl@recovery.svenv.nl "mkdir -p ~/recovery/etc/letsencrypt/"
ssh svenv.nl@recovery.svenv.nl "mkdir -p ~/recovery/srv/nginx/svenv/media/"
ssh svenv.nl@recovery.svenv.nl "mkdir -p ~/recovery/srv/postgresql/"


# Create letsencrypt backup (work around 5 certs / 7 days limitation)
rsync -a /etc/letsencrypt/ svenv.nl@recovery.svenv.nl:~/recovery/etc/letsencrypt/


# Create media backup
rsync -a /srv/nginx/svenv/media/ svenv.nl@recovery.svenv.nl:~/recovery/srv/nginx/svenv/media/


# Create database backup
rsync -a /srv/postgresql/ svenv.nl@recovery.svenv.nl:~/recovery/srv/postgresql/
