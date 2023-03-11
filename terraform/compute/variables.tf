variable "compartment_id" {
  description = "OCI Compartment ID"
  type        = string
}

variable "tenancy_ocid" {
  description = "The tenancy OCID."
  type        = string
}

variable "cluster_subnet_id" {
  description = "Subnet for the bastion instance"
  type        = string
}

variable "permit_ssh_nsg_id" {
  description = "NSG to permit SSH"
  type        = string
}

variable "ssh_authorized_keys" {
  description = "List of authorized SSH keys"
  type        = list(any)
}


variable "cidr_blocks" {
  description = "CIDRs of the network, use index 0 for everything"
  type        = list(any)
}

locals {
  ampere_instance_config = {
    shape_id = "VM.Standard.A1.Flex"
    ocpus    = 2
    ram      = 12

    // Canonical-Ubuntu-22.04-Minimal-aarch64-2022.11.05-0 us-sanjose-1	
    source_id   = "ocid1.image.oc1.us-sanjose-1.aaaaaaaak6owxhfqa333m7w6lu2fexqq5lqzfazmzt5xmvjiczagfnwfimnq"
    source_type = "image"

    metadata = {
      "ssh_authorized_keys" = join("\n", var.ssh_authorized_keys)
    }
  }
  micro_instance_config = {
    shape_id = "VM.Standard.E2.1.Micro"
    ocpus    = 1
    ram      = 1

    // Canonical-Ubuntu-22.04-Minimal-2023.02.14-0 us-sanjose-1
    source_id   = "ocid1.image.oc1.us-sanjose-1.aaaaaaaaw5ftoxuwoycpgmvtoqpz4mb664l6jgdivaslwuiljlqzehc7hwsq"
    source_type = "image"

    metadata = {
      "ssh_authorized_keys" = join("\n", var.ssh_authorized_keys)
    }
  }
}
