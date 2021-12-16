variable "access_token" {}

variable "project_id" {}

variable "key_path" {
  default = "/tmp"
}

variable "project" {
  default = "airline1-sabre-wolverine"
}

variable "keyring_name" {
  default = "wf-us-nonprod-kms-app01-res123"
}

variable "keyring_location" {
  default = "us"
}

variable "keyring_key_name" {
  default = "wf-us-nonprod-crypto-app01-res123" #cryptokey"
}

variable "keyring_import_job" {
  default = "my-import-job"
}
