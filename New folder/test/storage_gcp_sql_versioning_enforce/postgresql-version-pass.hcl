module "tfplan-functions" {
  source = "../../../common-functions/tfplan-functions/tfplan-functions.sentinel"
}

mock "tfplan/v2" {
  module {
    source = "mock-tfplan-postgresql-version-pass.sentinel"
  }
}

test {
  rules = {
    main = true
  }
}