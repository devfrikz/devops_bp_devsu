provider "aws" {
  region                   = "us-west-1"
  shared_credentials_files = "~/.aws/credentials"
  shared_config_files      = ["~/.aws/config"]
  profile                  = "devsu"


}
