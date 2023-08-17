output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.udacity_vpc.id
}

output "vpc_public_subnet_id" {
  description = "ID of the public subnet"
  value       = aws_subnet.udacity_vpc_public.id
}

output "vpc_private_subnet_id" {
  description = "ID of the private subnet"
  value       = aws_subnet.udacity_vpc_private.id
}

output "app_server_security_group_id" {
  description = "ID of the app server security group"
  value       = aws_security_group.app_server_security_group.id
}
