#!/bin/bash

# Generate a random 86-character string
RANDOM_STRING=$(openssl rand -base64 64 | tr -d '\n' | cut -c1-86)

# Base64 encode the string and remove any newlines
ENCODED_STRING=$(echo -n "$RANDOM_STRING" | base64 | tr -d '\n')

# Create the jwt-secret.yaml file
cat <<EOF > jwt-secret.yaml
apiVersion: v1
kind: Secret
metadata:
  name: jwt-secret
  namespace: yuval-skillup
type: Opaque
data:
  JWT_SECRET: $ENCODED_STRING
EOF

echo "JWT secret generated and saved in jwt-secret.yaml"
