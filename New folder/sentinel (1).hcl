mock "tfplan/v2" {
  module {
    source = "mock-tfplan-v2.sentinel"
  }
}
module "tfplan-functions" {
    source = "./tfplan-functions.sentinel"
}

policy "threat_gcp_kms_enforce" {
source = "./threat_gcp_kms_enforce.sentinel"
enforcement_level = "advisory"
}