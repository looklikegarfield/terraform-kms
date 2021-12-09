module "tfplan-functions" {
  source = "../../../common-functions/tfplan-functions/tfplan-functions.sentinel"
}

mock "tfplan/v2" {
  module {
    source = "mock-tfplan-org-iam-binding-pass.sentinel"
  }
}

test {
  rules = {
    main = true
  }
}