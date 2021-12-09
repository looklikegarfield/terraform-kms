variable "access_token" {}

variable "project_id" {}

variable "key_path" {
  default = "/tmp"
}

variable "project" {
  default = "airline1-sabre-wolverine"
}

variable "keyring_name" {
  default = "us-dev-appid-encr-test2-keyring2"
}

variable "keyring_location" {
  default = "us"
}

variable "keyring_key_name" {
  default = "us-dev-appid-encr-test2-cryptokey2"
}

variable "keyring_import_job" {
  default = "my-import-job"
}
