#Get the default VPC in eu-west-2
data "aws_vpc" "AbbasVPC" {
  default = true
}

#Get the subnets in the default VPC based on tag name = vpc-id
data "aws_subnets" "AbbasSubnet" {
  filter {
    name = "vpc-id"
    values = [data.aws_vpc.AbbasVPC.id]
  }
}

#Create Launch Template for ASG
resource "aws_launch_template" "tflaunchtemp" {
  name_prefix = "terraform_template"
  image_id = var.AMI["ubuntu22"]
  instance_type = "t3.micro"
  network_interfaces {
    associate_public_ip_address = true
    security_groups = var.SGID
  }
  block_device_mappings {
    device_name = "/dev/sda1"
    ebs {
      volume_size = 8
      delete_on_termination = true
    }
  }
}

#Create the Auto Scaling Group
resource "aws_autoscaling_group" "tf-asg" {
  max_size = 2
  min_size = 1
  desired_capacity = 1
  vpc_zone_identifier = [data.aws_subnets.AbbasSubnet.ids[0], data.aws_subnets.AbbasSubnet.ids[1]]
  launch_template {
    id = aws_launch_template.tflaunchtemp.id
    version = "$Latest"

  }
  tag {
    key                 = "Name"
    propagate_at_launch = false
    value               = "TfASG"
  }
}

data "aws_autoscaling_group" "asgips" {
  name = aws_autoscaling_group.tf-asg.name
}




# output "instance_public_ips" {
#   value = [
#   for instance in data.aws_autoscaling_group.asgips.instances : instance.public_ip
#   ]
# }