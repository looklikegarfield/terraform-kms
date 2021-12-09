module "tfplan-functions" {
  source = "../../../common-functions/tfplan-functions/tfplan-functions.sentinel"
}

mock "tfplan/v2" {
  module {
    source = "google_dialogflow_cx_agent-pass.sentinel"
  }
}

test {
  rules = {
    main = true
  }
}