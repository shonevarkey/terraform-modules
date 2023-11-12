resource "aws_iam_role" "bastion-role" {
  name = "bastionrole"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
  tags = {
    tag-key = "bastionrole"
  }
}
resource "aws_iam_instance_profile" "bastion_profile" {
  name = "bastion_profile"
  role = aws_iam_role.bastion-role.name
}
resource "aws_iam_role_policy" "bastion_policy" {
  name   = "bastion_policy"
  role   = aws_iam_role.bastion-role.name
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "ec2:*",
      "Resource": "*"
     },
     {
      "Effect": "Allow",
      "Action": "elasticloadbalancing:*",
      "Resource": "*"
     },
     {
      "Effect": "Allow",
      "Action": [
      "cloudwatch:ListMetrics",
      "cloudwatch:GetMetricStatistics",
      "cloudwatch:Describe*"
      ],
      "Resource": "*"
     },
     {
      "Effect": "Allow",
      "Action": "autoscaling:*",
      "Resource": "*"
     }
  ]
}
EOF
}

resource "aws_iam_role_policy" "cloudwatch_policy" {
  name   = "cloudwatch_policy"
  role   = aws_iam_role.bastion-role.name
  policy = <<EOF
{
    "Statement": [
        {
            "Action": [
                "cloudwatch:PutMetricData",
                "ec2:DescribeTags",
                "ec2:CreateTags",
                "logs:PutLogEvents",
                "logs:DescribeLogStreams",
                "logs:DescribeLogGroups",
                "logs:CreateLogStream",
                "logs:CreateLogGroup"
            ],
            "Resource": [
                "*"
            ],
            "Effect": "Allow"
        },
        {
            "Action": [
                "ssm:GetParameter",
                "ssm:PutParameter"
            ],
            "Resource": "arn:aws:ssm:*:*:parameter/AmazonCloudWatch-*",
            "Effect": "Allow"
        }
    ]
}
EOF
}

#data "template_file" "myuserdata" {
#  template = file("${path.cwd}/configs/bastiontemplate.tpl")
#}

resource "aws_instance" "bastion" {
  ami                    = var.bastion_ami
  instance_type          = var.bastion_instancetype
  subnet_id              = var.bastion_subnet
  vpc_security_group_ids = ["${var.bastion_sg_id}"]
  iam_instance_profile   = aws_iam_instance_profile.bastion_profile.name
  root_block_device {
    tags = {
      backup = "ec2-management"
    }
  }
  #user_data = data.template_file.myuserdata.template
  key_name  = var.bastion_key
  tags = {
    Name = "${var.bastion_name}"
  }
  lifecycle {
    create_before_destroy = true
  }
}
resource "aws_eip" "eip" {
  instance = aws_instance.bastion.id
  domain   = "vpc"
}