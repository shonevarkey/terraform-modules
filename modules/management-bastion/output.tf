output "bastion_id" {
  value = aws_instance.bastion.id
}
output "bastion_privateip" {
  value = aws_instance.bastion.private_ip
}
output "bastion_eip" {
  value = aws_instance.bastion.public_ip
}
output "bastion_az" {
  value = aws_instance.bastion.availability_zone
}
output "bastion_subnet" {
  value = aws_instance.bastion.subnet_id
}