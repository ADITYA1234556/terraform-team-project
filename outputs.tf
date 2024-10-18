output "pubsub1id" {
  value = data.aws_subnets.mypubsub.ids[0]
}

output "pubsub2id" {
  value = data.aws_subnets.mypubsub.ids[1]
}