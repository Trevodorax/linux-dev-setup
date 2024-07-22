#!/bin/bash

BACKUP_DIR="/opt/backup/postgresql"
DB_NAME="weekly-news"
DB_USER="weekly"
DB_HOST="localhost"
DATE=$(date +%Y-%m-%d_%H-%M-%S)

pg_dump -U $DB_USER -h $DB_HOST $DB_NAME > $BACKUP_DIR/backup_"$DATE".sql
