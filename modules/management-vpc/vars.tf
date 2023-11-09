variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}
variable "vpc_name" {
  description = "Name of VPC"
  type        = string
}

variable "subnet1_cidr" {
  description = "Subnet1 CIDR"
  type        = string
}

variable "subnet1_name" {
  description = "Public Subnet Name"
  type        = string
}

variable "availability_zone1" {
  description = "AZ 1"
  type        = string
}

variable "availability_zone2" {
  description = "AZ 2"
  type        = string
}

variable "subnet2_cidr" {
  description = "Subnet2 CIDR"
  type        = string
}

variable "subnet2_name" {
  description = "Public Subnet Name"
  type        = string
}

variable "subnet3_cidr" {
  description = "Subnet3 CIDR"
  type        = string
}

variable "subnet3_name" {
  description = "Private Subnet Name"
  type        = string
}

variable "gw_name" {
  description = "Internet gateway Name"
  type        = string
}

variable "rtbprivate_name" {
  description = "Private route table name"
  type        = string
}

variable "rtbpublic_name" {
  description = "Public route table name"
  type        = string
}

variable "s3-flowlog-bucket-name" {
  description = "S3 bucket for VPC flowlogs"
  type        = string
}

variable "flowlog_name" {
  description = "S3 bucket for VPC flowlogs"
  type        = string
}