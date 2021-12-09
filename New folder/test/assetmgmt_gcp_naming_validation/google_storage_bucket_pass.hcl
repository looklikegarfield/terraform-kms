module "tfplan-functions" {
  source = "../../../common-functions/tfplan-functions/tfplan-functions.sentinel"
}

mock "tfplan/v2" {
  module {
    source = "google_storage_bucket-pass.sentinel"
  }
}

test {
  rules = {
    main = true
  }
}

param "environment" {
  value =   ["prod", "int", "uat", "stage", "dev", "test"] 
}