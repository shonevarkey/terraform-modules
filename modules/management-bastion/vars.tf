variable "vpc_id" {
  description = "VPC ID"
  type        = string
}
variable "bastion_name" {
  description = "Bastion Instance name"
  type        = string
}
variable "bastion_key" {
  description = "SSH Key pair"
  type        = string
}
variable "bastion_volumesize" {
  description = "Bastion EBS volume size"
  type        = string
}
variable "bastion_sg_id" {
  description = "Bastion Security group ID"
  type        = string
}
variable "bastion_ami" {
  description = "Bastion AMI"
  type        = string
}
variable "bastion_instancetype" {
  description = "Bastion instance type"
  type        = string
}
variable "bastion_subnet" {
  description = "Bastion subnet"
  type        = string
}