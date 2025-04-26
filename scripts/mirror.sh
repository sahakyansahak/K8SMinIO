#!/bin/bash
apt-get update
apt install -y curl
curl https://dl.min.io/client/mc/release/linux-amd64/mc --output mc
chmod +x mc
mv mc /usr/local/bin/
mc alias set aws https://s3.amazonaws.com <ACCESS-KEY> <ACCESS-SECRET>
mc alias set storage http://minio.storage.svc.cluster.local:9000 admin supersecure
mc mirror --overwrite --remove storage/buckups aws/s3huddleweb
