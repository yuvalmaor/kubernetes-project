#bash
certbot certonly \
  --dns-cloudflare \
  --dns-cloudflare-credentials /home/mejerowicz-y/cloudflare.ini \
  --email yuvalnix305@gmail.com \
  --agree-tos \
  --non-interactive \
  -d kubeingress.yuvallab.xyz


cat <<EOF > app-tls-secret.yaml
apiVersion: v1
kind: Secret
metadata:
  name: app-tls-secret
  namespace: yuval-skillup
type: kubernetes.io/tls
data:
  tls.crt: $(cat /etc/letsencrypt/live/kubeingress.yuvallab.xyz/fullchain.pem | base64 -w 0 | tr -d '\n')
  tls.key: $(cat /etc/letsencrypt/live/kubeingress.yuvallab.xyz/privkey.pem | base64 -w 0 | tr -d '\n')
EOF