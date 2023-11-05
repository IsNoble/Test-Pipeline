terraform {
 backend "gcs" {
   bucket  = "smason-test-pipeline-gcp-remote-state-bucket"
   prefix  = "terraform/state"
 }
}