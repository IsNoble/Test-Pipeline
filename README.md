### Deployment
~~Currently deployed via a helm manged GKE cluster at [stephenrmason.net](http://www.stephenrmason.net)~~
Above currently non-functional due to cost of continuously running multiple pods in GKE.

### Architecture
- Basic tests are run via a github workflow [Here](https://github.com/IsNoble/Test-Pipeline-GCP/blob/main/.github/workflows/python-app.yml)
- Application is containerized with docker and pushed to ghcr [Here](https://github.com/IsNoble/Test-Pipeline-GCP/blob/main/.github/workflows/docker-publish.yml)
- Google resournces created via terraform files [Here](https://github.com/IsNoble/Test-Pipeline-GCP/tree/v0.5.0/terraform)
- Docker image is pulled by Kubernetes deployment, traffic from [stephenrmason.net](www.stephenrmason.net) is directed to the pods via a LoadBalancer, code [Here](https://github.com/IsNoble/Test-Pipeline-GCP/blob/main/tpGCPdjangoapp/tpgcpdjangoapp.yaml) and cluster [Here](https://console.cloud.google.com/kubernetes/clusters/details/us-central1/simple-autopilot-public-cluster/details?project=smason-test-pipeline-gcp)


# Test-Pipeline-GCP
A demo of a GCP based CI/CD Pipeline.
CI (Git Actions)
CD (ArgoCD/Kubernetes/GKE)

### Disclaimer
This project is purely for example/educational purposes. For a production static web page I would just publish the container and use [Google Cloud Run](https://cloud.google.com/run?hl=en), which is much more cost effective

### TO-DO
- ~~Add terraform scripts to generate a GKE cluster~~
- ~~Create K8's manifests files for Django Ap~~
- ~~use Google Manged SSL to create a cert for [PLACEHOLDER DOMAIN NAME]~~ NOTE: Did not need to do this yet, will implement later
  - ~~Acquire domain name for project~~
- ~~Add DNS entry that points to the LoadBalancer of k8'S SERVICE~~
- ~~Packages K8's manifest into a Helm chart~~
- ~~Remove (currently) redundant k8's manifest files~~
- ~~Add terraform code to generate bucket for static django app files~~
  - Generate static storage bucket
  - set public ACL for static storage bucket.
- ~~Deploy ArgoCD via helm to my cluster~~
  - ON HOLD: argoCD testing will take place in local minikube cluster due to cost constraints. 
- Setup and configure external DNS
- Setup and configure CertManager
- Setup HTTPS vis Istio Gateway
- Re-add cosign for docker image signing
- Per GitOps best practice, Seperate application code and configuration code into seperate repos


