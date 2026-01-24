output "instance_id" {
  value = aws_instance.catalogue.id
}

output "private_ip" {
  value = aws_instance.catalogue.private_ip
}
