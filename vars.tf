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
    ubuntu22 = ""
    linux = ""
  }
}