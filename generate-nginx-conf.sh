set -a
source .env
set +a
echo "HOST_IP is set to: $HOST_IP"
envsubst "\$HOST_IP" < nginx.template > nginx.conf
