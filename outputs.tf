output "pubsub1id" {
  value = data.aws_subnets.AbbasSubnet.ids[0]
}

output "pubsub2id" {
  value = data.aws_subnets.AbbasSubnet.ids[1]
}