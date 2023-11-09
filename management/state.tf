terraform {
  backend "s3" {
    bucket                   = "lanternstudios-mgmt-terraform-state-us-east-1"
    key                      = "management/lanternstudios/management.tfstate"
    region                   = "us-east-1"
    shared_credentials_files = ["~/.aws/credentials"]
  }
}
