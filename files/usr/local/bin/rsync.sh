#!/bin/bash

# Svenv.nl rsync backup script
# Creates new backups for fast recovery

# Summary:
# --------
# * Create media backup
# * Create database backup


# Create target directories
ssh -t svenv.nl@recovery.svenv.nl "mkdir -p ~/recovery/srv/nginx/svenv/media/"
ssh -t svenv.nl@recovery.svenv.nl "mkdir -p ~/recovery/srv/postgresql/"

# Create media backup
rsync -a /srv/nginx/svenv/media/ svenv.nl@recovery.svenv.nl:~/recovery/srv/nginx/svenv/media/

# Create database backup
rsync -a /srv/postgresql/ svenv.nl@recovery.svenv.nl:~/recovery/srv/postgresql/
