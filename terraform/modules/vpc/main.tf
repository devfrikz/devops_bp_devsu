locals {
  vpc_cidr       = var.vpc_cidr
  public_subnets = var.public_subnets
}

data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_vpc" "devops_devsu_vpc" {
  cidr_block           = local.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name        = "${var.name}-vpc-${var.environment}"
    Environment = var.environment
  }
}

resource "aws_internet_gateway" "devops_devsu_vpc" {
  vpc_id = aws_vpc.devops_devsu_vpc.id

  tags = {
    Name        = "${var.name}-internet-gateway-${var.environment}"
    Environment = var.environment
  }
}

resource "aws_route_table" "devops_devsu_vpc" {
  vpc_id = aws_vpc.devops_devsu_vpc.id

  tags = {
    Name        = "${var.name}-routing-table-public-${var.environment}"
    Environment = var.environment
  }
}

resource "aws_route" "devops_devsu_route" {
  route_table_id         = aws_route_table.devops_devsu_vpc.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.devops_devsu_vpc.id
}


resource "aws_subnet" "devops_devsu_subnets" {
  count                   = length(local.public_subnets)
  vpc_id                  = aws_vpc.devops_devsu_vpc.id
  cidr_block              = local.public_subnets[count.index]
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name        = "${var.name}-subnet-public-${var.environment}-${count.index}"
    Environment = var.environment
  }
}

resource "aws_route_table_association" "devops_devsu_rta" {
  count          = length(var.public_subnets)
  subnet_id      = aws_subnet.devops_devsu_subnets[count.index].id
  route_table_id = aws_route_table.devops_devsu_vpc.id
}


resource "aws_vpc_endpoint" "devops_devsu_s3_endpoint" {
  vpc_id          = aws_vpc.devops_devsu_vpc.id
  service_name    = "com.amazonaws.${var.region}.s3"
  route_table_ids = [aws_route_table.devops_devsu_vpc.id] 
}


