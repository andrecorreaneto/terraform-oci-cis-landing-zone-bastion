module "lz_bastion" {
    source = "git::https://github.com/andrecorreaneto/terraform-oci-cis-landing-zone-base-modules.git//security/bastion"
    tenancy_id = var.tenancy_ocid
    target_compartment = var.security_compartment
    network_compartment = var.network_compartment
    bastions = { for k, v in var.bastions : k => {
        name = v.name
        vcn_name = v.vcn_name
        subnet_name = v.subnet_name
        allowed_cidrs = v.allowed_cidrs
        max_session_ttl_in_seconds = v.max_session_ttl_in_seconds
        defined_tags = v.defined_tags
        freeform_tags = v.freeform_tags
    }}
}