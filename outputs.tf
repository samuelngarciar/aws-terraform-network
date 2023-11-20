output "vpc_id" {
  value = aws_vpc.vpccloud.id
}

output "region_name" {
  value = var.region
}

output "subnet_id" {
  value = data.aws_subnet.subnetcloud.id
}

