# Create the Security Group
resource "aws_security_group" "management" {
  vpc_id      = module.mgt_vpc.vpc_id
  name        = "sgrp-management-lantern-bastion"
  description = "Allow management bastion access"
  # allow ingress of port 22
  ingress {
    description = "Allow SSH from Private IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["202.88.248.185/32"]
  }

  # allow ingress of port 22
  ingress {
    description = "Allow SSH from VPN"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # allow egress of all ports
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "sgrp-management-lantern-bastion"
  }
}