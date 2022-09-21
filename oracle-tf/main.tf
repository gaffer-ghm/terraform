terraform {
  required_providers {
    oci = {
      source = "hashicorp/oci"
    }
  }
}

provider "oci" {
  region              = "us-sanjose-1"  // customize this
  /* region - value should match your OCI region. */
  auth                = "SecurityToken"
  config_file_profile = "learn-terraform"
}

resource "oci_core_vcn" "internal" {
  dns_label      = "internal"
  cidr_block     = "172.16.0.0/20"
  compartment_id = "<your_compartment_OCID_here>"  // customize this
  /* compartment_id - value should match your "OCID" which you can get by clicking on the profile icon in the far top right of the OCI console and selecting "Tenancy: YourUsername" from the dropdown menu. */
  display_name   = "My internal VCN"
}

