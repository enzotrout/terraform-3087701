# Plan-only test: no AWS calls or infrastructure changes.
# The official Amazon Linux SSM parameter is public, so the output must
# remain non-sensitive and the plan must succeed.
mock_provider "aws" {
  mock_data "aws_ssm_parameter" {
    defaults = {
      insecure_value = "ami-0123456789abcdef0"
    }
  }
}

run "plans_ec2_with_public_ami_id" {
  command = plan

  assert {
    condition     = aws_instance.web.ami == "ami-0123456789abcdef0"
    error_message = "The instance must use the public AMI ID from SSM."
  }

  assert {
    condition     = output.instance_ami == "ami-0123456789abcdef0"
    error_message = "The AMI output should be available without sensitive-value errors."
  }
}
