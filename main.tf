#Get the default VPC in eu-west-2
data "aws_vpc" "default" {
  default = true
}




# output "instance_public_ips" {
#   value = [
#   for instance in data.aws_autoscaling_group.asgips.instances : instance.public_ip
#   ]
# }
