output "instance_id" {
  description = "ID da Instância"
  value       = aws_instance.web.id
}

output "public_ip" {
  description = "IP Público da instância"
  value       = aws_instance.web.public_ip
}