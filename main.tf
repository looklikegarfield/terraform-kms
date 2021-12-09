#resource "google_kms_key_ring" "keyring" {
#  name     = "us-dev-appid-encr-test1-keyring"
#  location = "eu"
#}
#
#resource "google_kms_crypto_key" "example-key" {
#  name                          = "us-dev-appid-encr-test1-cryptokey"
#  key_ring                      = google_kms_key_ring.keyring.id
#  skip_initial_version_creation = false   ##true
#  #import_only                   = true
#  rotation_period = "100000s"   ## "7776000s" # 90 days
#
#  labels = {
#    env                  = "dev"
#    application_division = "paa",
#    application_name     = "demo",
#    application_role     = "app",
#    au                   = "0223092",
#    created              = "20211124",
#    data_compliance      = "pci",
#    data_confidentiality = "pub",
#    data_type            = "test",
#    environment          = "dev",
#    gcp_region           = "eu",
#    owner                = "hybridenv",
#  }
#}
#
#resource "google_kms_key_ring_import_job" "import-job" {
#  key_ring      = google_kms_key_ring.keyring.id
#  import_job_id = "my-import-job"
#
#  import_method    = "RSA_OAEP_3072_SHA1_AES_256"
#  protection_level = "SOFTWARE"
#}
#
##resource "google_kms_key_ring_iam_member" "app_keyring" {
##  key_ring_id = "google_kms_key_ring.keyring.id"
##  role        = "roles/cloudkms.admin"
##  member      = "serviceAccount:demo-sentinel-sa@airline1-sabre-wolverine.iam.gserviceaccount.com"
##}
#

#resource "google_kms_key_ring" "keyring" {
#  project  = var.project
#  name     = var.keyring_name
#  location = var.keyring_location
#}

resource "google_kms_crypto_key" "example-key" {
  name                          = var.keyring_key_name
  key_ring                      = data.google_kms_key_ring.keyring.id
  skip_initial_version_creation = true
  import_only                   = true
  rotation_period = "7776000s" # 90 days
  labels = {
    env                  = "dev"
    application_division = "paa",
    application_name     = "demo",
    application_role     = "app",
    au                   = "0223092",
    created              = "20211124",
    data_compliance      = "pci",
    data_confidentiality = "pub",
    data_type            = "test",
    environment          = "dev",
    gcp_region           = "us",
    owner                = "hybridenv",
  }
}

resource "google_kms_key_ring_import_job" "import-job" {
  key_ring      = data.google_kms_key_ring.keyring.id
  import_job_id = var.keyring_import_job

  import_method    = "RSA_OAEP_3072_SHA1_AES_256"
  protection_level = "SOFTWARE"
}

data "google_kms_key_ring" "keyring" {
  name     = var.keyring_name
  location = var.keyring_location
}

resource "null_resource" "proto_descriptor" {
  provisioner "local-exec" {
    command = <<EOT
    /usr/bin/openssl rand 32 > ${var.key_path}/test.bin
    EOT
  }
}


resource "null_resource" "import" {

  provisioner "local-exec" {
    command = <<EOT
    gcloud kms keys versions import \
      --import-job ${var.keyring_import_job} \
      --location ${var.keyring_location} \
      --keyring ${var.keyring_name} \
      --key ${var.keyring_key_name} \
      --algorithm google-symmetric-encryption \
      --target-key-file ${var.key_path}/test.bin
    EOT
  }
}