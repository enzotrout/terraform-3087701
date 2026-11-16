variable "aws_region" {
  description = "AWS Region for the example EC2 instance and AMI lookup."
  type        = string
  default     = "us-west-2"
}

variable "instance_type" {
  description = "EC2 instance type for the learning example."
  type        = string
  default     = "t3.nano"
}
