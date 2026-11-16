output "instance_ami" {
  description = "AMI ID used by the example EC2 instance."
  value       = aws_instance.web.ami
}

output "instance_arn" {
  description = "ARN of the example EC2 instance."
  value       = aws_instance.web.arn
}
