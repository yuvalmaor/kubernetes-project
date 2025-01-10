# kubernetes-project
# Full Stack Application Deployment on Minikube with SSL

This project includes a frontend and backend application, both containerized and deployed on Minikube with SSL enabled using an NGINX Ingress Controller.

## Project Structure

- **Frontend**: Deployed as a Docker container running on port 80.
- **Backend**: Deployed as a Docker container running on port 8080.
- **Deployment**: Managed via Kubernetes manifests, including `Deployment`, `Service`, and `Ingress` resources.
- **SSL**: Secured with an SSL certificate configured in the NGINX Ingress.

---

## Prerequisites

- **Minikube** installed and configured.
- **kubectl** command-line tool installed.
- **Docker** installed for building images.
- **NGINX Ingress Controller** installed in Minikube.
- **TLS Certificate** configured (stored in a Kubernetes secret).

---

## Deployment Steps

### 1. Start Minikube
```bash
minikube start

