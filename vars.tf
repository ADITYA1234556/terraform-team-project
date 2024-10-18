variable "REGION" {
  default = "eu-west-2"
}

variable "ZONE1" {
  default = "eu-west-2a"
}

variable "NAME" {
  default = "tfasg"
}
variable "AMI" {
  type = map(string)
  default = {
    ubuntu22 = "ami-03ceeb33c1e4abcd1"
    linux = "ami-03c6b308140d10488"
  }
}

variable "SGID" {
  description = "Security group ID"
  type = list(string)
  default = ["sg-0761e67d589b6b1c5"]
}