/**
 * Copyright 2019 Google LLC
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

/******************************************
  Module project_iam_binding calling
 *****************************************/
module "project_iam_binding" {
  source  = "terraform-google-modules/iam/google//modules/projects_iam"
  version = "~> 8.0"

  projects = [var.project_one, var.project_two]
  mode     = "additive"

  bindings = {
    "roles/compute.networkAdmin" = [
      "serviceAccount:${var.sa_email}",
      "group:${var.group_email}",
      "user:${var.user_email}",
    ]
    "roles/appengine.appAdmin" = [
      "serviceAccount:${var.sa_email}",
      "group:${var.group_email}",
      "user:${var.user_email}",
    ]
  }

  conditional_bindings = [
    {
      role        = "roles/storage.admin"
      title       = "expires_after_2019_12_31"
      description = "Expiring at midnight of 2019-12-31"
      expression  = "request.time < timestamp(\"2020-01-01T00:00:00Z\")"
      members = [
        "serviceAccount:${var.sa_email}",
        "group:${var.group_email}",
        "user:${var.user_email}",
      ]
    }
  ]
}

# IAM Binding: REMOVE roles/viewer for user:adityavverma@google.com
resource "google_project_iam_member_remove" "remove_viewer_adityavverma" {
  project = var.project_one # Assuming var.project_one corresponds to "terraform-294433"
  role    = "roles/viewer"
  member  = "user:adityavverma@google.com"
}

# IAM Binding: ADD roles/cloudquotas.viewer for user:adityavverma@google.com
resource "google_project_iam_member" "add_cloudquotas_viewer_adityavverma" {
  project = var.project_one # Assuming var.project_one corresponds to "terraform-294433"
  role    = "roles/cloudquotas.viewer"
  member  = "user:adityavverma@google.com"
}

# IAM Binding: REMOVE roles/owner for user:ankurdua@google.com
resource "google_project_iam_member_remove" "remove_owner_ankurdua" {
  project = var.project_one # Assuming var.project_one corresponds to "terraform-294433"
  role    = "roles/owner"
  member  = "user:ankurdua@google.com"
}

# IAM Binding: ADD organizations/9454078371/roles/CustomRole262 for user:ankurdua@google.com
resource "google_project_iam_member" "add_custom_role_ankurdua" {
  project = var.project_one # Assuming var.project_one corresponds to "terraform-294433"
  role    = "organizations/9454078371/roles/CustomRole262"
  member  = "user:ankurdua@google.com"
}