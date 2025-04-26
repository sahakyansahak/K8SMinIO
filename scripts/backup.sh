#!/bin/bash
apt-get update
apt install -y curl
apt-get install -y postgresql-client-17
curl https://dl.min.io/client/mc/release/linux-amd64/mc --output mc
chmod +x mc
mv mc /usr/local/bin/
pg_dump -h postgresql -U postgres | gzip > /tmp/db.sql.gz
mc alias set storage http://34.28.172.178:9000 admin supersecure
mc cp /tmp/db.sql.gz storage/bukups/
