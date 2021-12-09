module "tfplan-functions" {
  source = "../../../common-functions/tfplan-functions/tfplan-functions.sentinel"
}

mock "tfplan/v2" {
  module {
    source = "mock-tfplan-google_storage_bucket-pass.sentinel"
  }
}

test {
  rules = {
    main = true
  }
}