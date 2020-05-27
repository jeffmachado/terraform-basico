output "ami_id" {
  description = "ID da AMI"
  value       = aws_ami_from_instance.ami_padrao.id
}