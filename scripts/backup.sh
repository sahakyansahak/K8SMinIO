#!/bin/sh
pg_dump -h postgres-postgresql -U postgres | gzip > /tmp/db.sql.gz
mc alias set storage $S3_ENDPOINT $S3_ACCESS_KEY $S3_SECRET_KEY
mc cp /tmp/db.sql.gz storage/backups/
