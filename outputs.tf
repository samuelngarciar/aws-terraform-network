output "vpc_id" {
  value = aws_vpc.vpccloud.id
}

output "region_name" {
  value = var.region
}
