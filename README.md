### Deployment
Currently deployed via a helm manged GKE cluster at [stephenrmason.net](http://www.stephenrmason.net)

### Architecture
- Basic tests are run via a github workflow [Here](https://github.com/IsNoble/Test-Pipeline-GCP/blob/main/.github/workflows/python-app.yml)
- Application is containerized with docker and pushed to ghcr [Here](https://github.com/IsNoble/Test-Pipeline-GCP/blob/main/.github/workflows/docker-publish.yml)
- Google resournces created via terraform files [Here](https://github.com/IsNoble/Test-Pipeline-GCP/tree/v0.5.0/terraform)
- Docker image is pulled by Kubernetes deployment, traffic from [stephenrmason.net](www.stephenrmason.net) is directed to the pods via a LoadBalancer, code [Here](https://github.com/IsNoble/Test-Pipeline-GCP/blob/main/tpGCPdjangoapp/tpgcpdjangoapp.yaml) and cluster [Here](https://console.cloud.google.com/kubernetes/clusters/details/us-central1/simple-autopilot-public-cluster/details?project=smason-test-pipeline-gcp)


# Test-Pipeline-GCP
A demo of a GCP based CI/CD Pipeline

### Disclaimer
This project is purely for example/educational purposes. For a production static web page I would just publish the container and use [Google Cloud Run](https://cloud.google.com/run?hl=en), which is much more cost effective

### TO-DO
- ~~Add terraform scripts to generate a GKE cluster~~
- ~~Create K8's manifests files for Django Ap~~
- ~~use Google Manged SSL to create a cert for [PLACEHOLDER DOMAIN NAME]~~ NOTE: Did not need to do this yet, will implement later
  - ~~Acquire domain name for project~~
- ~~Add DNS entry that points to the LoadBalancer of k8'S SERVICE~~
- Packages K8's manifest into a Helm chart
- Add terraform code to generate bucket for static django app files
  - set public ACL for static storage bucket.
- Remove (currently) redundant k8's manifest files
  - Alternatively, use extra files to setup https
- Deploy ArgoCD via helm to my cluster
- Re-add cosign for docker image signing
- Setup a service account for applications to access the GCP project. 


