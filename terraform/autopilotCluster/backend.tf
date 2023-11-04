terraform {
 backend "gcs" {
   bucket  = "app-demo-smason-remotestate-bucket"
   prefix  = "terraform/state"
 }
}