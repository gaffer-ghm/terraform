resource "oci_core_subnet" "dev" {
  vcn_id                      = oci_core_vcn.internal.id
  cidr_block                  = "172.16.0.0/24"
  compartment_id              = "<your_compartment_OCID_here>"  // customize this
  display_name                = "Dev subnet 1"
  prohibit_public_ip_on_vnic  = true
  dns_label                   = "dev"
}

