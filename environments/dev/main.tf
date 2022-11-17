# Copyright 2019 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


locals {
  env = "dev"
}

provider "google" {
  project = "${var.project}"
}

module "datafusion" {
  source  = "../../modules/datafusion"
  project = "${var.project}"
  env     = "${local.env}"
}

module "networking" {
  source  = "../../modules/networking"
  project = "${var.project}"
  env     = "${local.env}"
  instance_name = "${module.datafusion.instance_name}"
  instance_region = "${module.datafusion.instance_region}"
  tenant_project_id = "${module.datafusion.tenant_datafusion_instance}"
}

