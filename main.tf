resource "google_kms_key_ring" "keyring" {
  name     = "us-dev-appid-encr-test1-keyring"
  location = "us"
}

resource "google_kms_crypto_key" "example-key" {
  name            = "us-dev-appid-encr-test1-cryptokey"
  key_ring        = google_kms_key_ring.keyring.id
  skip_initial_version_creation = true
  import_only                   = true
  rotation_period = "7776000s"  # 90 days
}

resource "google_kms_key_ring_import_job" "import-job" {
  key_ring = google_kms_key_ring.keyring.id
  import_job_id = "my-import-job"

  import_method = "RSA_OAEP_3072_SHA1_AES_256"
  protection_level = "SOFTWARE"
}