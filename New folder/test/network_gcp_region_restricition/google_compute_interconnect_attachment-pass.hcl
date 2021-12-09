module "tfplan-functions" {
  source = "../../../common-functions/tfplan-functions/tfplan-functions.sentinel"
}

mock "tfplan/v2" {
  module {
    source = "google_compute_interconnect_attachment-pass.sentinel"
  }
}

test {
  rules = {
    main = true
  }
}