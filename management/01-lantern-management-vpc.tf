locals {
  vpc_cidr = "10.10.0.0/16"
  vpc_name = "vpc-management-lantern-us-east-1"
  #tenancy = "dedicated"
  subnet1_cidr           = "10.10.10.0/24"
  subnet1_name           = "subnet-management-lantern-public-us-east-1-az1"
  subnet2_cidr           = "10.10.15.0/24"
  subnet2_name           = "subnet-management-lantern-public-us-east-1-az2"
  subnet3_cidr           = "10.10.20.0/24"
  subnet3_name           = "subnet-management-lantern-private-us-east-1-az1"
  gw_name                = "igw-management-lantern-us-east-1"
  rtbprivate_name        = "rtb-management-lantern-private-us-east-1"
  rtbpublic_name         = "rtb-management-lantern-public-us-east-1"
  s3-flowlog-bucket-name = "management-lantern-vpc-flowlogs"
  flowlog_name           = "flowlogs-vpc-management-lantern-us-east-1"
  environment            = "management"
  account-id             = "560441954140"
  availability_zone1     = "us-east-1a"
  availability_zone2     = "us-east-1b"

}
module "mgt_vpc" {
  source   = "../modules/management-vpc"
  vpc_cidr = local.vpc_cidr
  vpc_name = local.vpc_name
  #tenancy = local.tenancy
  subnet1_cidr           = local.subnet1_cidr
  subnet1_name           = local.subnet1_name
  subnet2_cidr           = local.subnet2_cidr
  subnet2_name           = local.subnet2_name
  subnet3_cidr           = local.subnet3_cidr
  subnet3_name           = local.subnet3_name
  gw_name                = local.gw_name
  rtbprivate_name        = local.rtbprivate_name
  rtbpublic_name         = local.rtbpublic_name
  s3-flowlog-bucket-name = local.s3-flowlog-bucket-name
  flowlog_name           = local.flowlog_name
  availability_zone1     = local.availability_zone1
  availability_zone2     = local.availability_zone2
}
