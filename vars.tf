# vars.tf

variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "eu-west-2"  # Change this to your preferred region
}

variable "ami_id" {
  description = "The AMI ID for the EC2 instances"
  type        = string
  default     = "ami-0e8d228ad90af673b"  # Replace with a valid AMI ID for your region
}

variable "vpc_subnet_id" {
  description = "The VPC Subnet ID where the ASG will be deployed"
  type        = string
  default     = "subnet-xxxxxx"  # Replace with your subnet ID
}
