locals {
  bastion_name         = "bastion-management-lantern"
  bastion_key          = "key-lantern-us-east-1.pub"
  bastion_volumesize   = "20"
  bastion_ami          = "ami-0fc5d935ebf8bc3bc"
  bastion_instancetype = "t3a.micro"
}
module "mgt_bastion" {
  source               = "../modules/management-bastion"
  vpc_id               = module.mgt_vpc.vpc_id
  bastion_sg_id        = aws_security_group.management.id
  bastion_subnet       = module.mgt_vpc.public_subnet1_id
  bastion_name         = local.bastion_name
  bastion_key          = local.bastion_key
  bastion_volumesize   = local.bastion_volumesize
  bastion_ami          = local.bastion_ami
  bastion_instancetype = local.bastion_instancetype
}