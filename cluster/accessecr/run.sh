#!/bin/bash

# Ensure the script exits on any error
set -e

# Check if AWS environment variables are set
if [ -z "$AWS_ACCESS_KEY_ID" ] || [ -z "$AWS_SECRET_ACCESS_KEY" ] || [ -z "$AWS_SESSION_TOKEN" ]; then
  echo "Error: AWS credentials are not set. Please export AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, and AWS_SESSION_TOKEN before running the script."
  exit 1
fi

# AWS Region and ECR Repository URL
AWS_REGION="us-east-1"
ECR_URL="253650698585.dkr.ecr.$AWS_REGION.amazonaws.com"

# Kubernetes Secret Name
SECRET_NAME="ecr-registry-secret"

# Log in to AWS ECR
echo "Logging in to AWS ECR..."
aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $ECR_URL

# Check Kubernetes Version
echo "Checking Kubernetes version..."
kubectl version --short

# Create or Update Kubernetes Secret
echo "Creating Kubernetes image pull secret..."
kubectl delete secret $SECRET_NAME --ignore-not-found
kubectl create secret docker-registry $SECRET_NAME \
  --docker-server=$ECR_URL \
  --docker-username=AWS \
  --docker-password=$(aws ecr get-login-password --region $AWS_REGION)

# Update Deployments to Use the Secret
# Modify this section as needed for your specific deployments
echo "Patching deployments to use the image pull secret..."
kubectl patch serviceaccount default \
  -p '{"imagePullSecrets": [{"name": "'$SECRET_NAME'"}]}'

echo "Script execution completed successfully."
