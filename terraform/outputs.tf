output "vpc_id" {
  value = aws_vpc.main.id
}

output "subnet_1" {
  value = aws_subnet.public_1.id
}

output "subnet_2" {
  value = aws_subnet.public_2.id
}
