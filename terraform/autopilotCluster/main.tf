/**
 * Copyright 2022 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#Local varibles, no exposed outside this .tf file
locals {
  cluster_type           = "simple-autopilot-public"
  network_name           = "simple-autopilot-public-network"
  subnet_name            = "simple-autopilot-public-subnet"
  master_auth_subnetwork = "simple-autopilot-public-master-subnet"
  pods_range_name        = "ip-range-pods-simple-autopilot-public"
  svc_range_name         = "ip-range-svc-simple-autopilot-public"
  # Gen'ed by iterating through a list of subnet self-links from module.gcp-network. Splits off the last part of the self-links
  subnet_names           = [for subnet_self_link in module.gcp-network.subnets_self_links : split("/", subnet_self_link)[length(split("/", subnet_self_link)) - 1]]
}

#Fetches the google cloud client config data using GC creds that are available. Used to Auth GC services
data "google_client_config" "default" {}

#Configures the kubernets provider
provider "kubernetes" {
  host                   = "https://${module.gke.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(module.gke.ca_certificate)
}

#Instantiates the GKE Module
module "gke" {
  source                          = "terraform-google-modules/kubernetes-engine/google//modules/beta-autopilot-public-cluster"
  project_id                      = var.project_id
  name                            = "${local.cluster_type}-cluster"
  regional                        = true
  region                          = var.region
  network                         = module.gcp-network.network_name
  subnetwork                      = local.subnet_names[index(module.gcp-network.subnets_names, local.subnet_name)]
  ip_range_pods                   = local.pods_range_name
  ip_range_services               = local.svc_range_name
  release_channel                 = "REGULAR"
  enable_vertical_pod_autoscaling = true
  network_tags                    = [local.cluster_type]
  #deletion_protection             = false
}
