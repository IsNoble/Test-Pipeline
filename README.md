# Test-Pipeline-GCP
A demo of a GCP based CI/CD Pipeline

### Disclaimer
This project is purely for example/educational purposes. For a production static web page I would just publish the container and use [Google Cloud Run](https://cloud.google.com/run?hl=en), which is much more cost effective

### TO-DO
- ~~Add terraform scripts to generate a GKE cluster~~
- Create K8's manifests files for Django App
- use Google Manged SSL to create a cert for [PLACEHOLDER DOMAIN NAME]
  - Acquire domain name for project
- Add DNS entry that points to the LoadBalancer of k8'S SERVICE
- Packages K8's manifest into a Helm chart
- Re-add cosign for docker image signing
- Setup a service account for applications to access the GCP project. 


