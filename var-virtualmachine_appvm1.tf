locals {
  linux_image_ids = {
    #RHEL VM with Oracle Client
    # "gaim-eastus2-dev-app-vm-01" = "/subscriptions/a722ec0a-ab02-4541-8da5-3fe73d3d61f3/resourceGroups/oracle-images-rg/providers/Microsoft.Compute/galleries/Oracle_SIG/images/Oracle_Client_RHEL7/versions/19.20210407.185156"
    "gaim-eastus2-dev-app-vm-01" = "/subscriptions/fc10d2c6-0741-45d9-863e-725c45e3abb4/resourceGroups/14152-eastus2-devops-rg/providers/Microsoft.Compute/galleries/14152eastus2devopssig/images/gaim/versions/0.0.2021061511"
  }
}

# Diagnostics Extensions
variable "todoapp_image_id" {
  type        = string
  description = "The image id"
  default     = null
}
