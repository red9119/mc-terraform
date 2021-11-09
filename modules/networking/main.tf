resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
 
  tags = {
    Name = "mcterraform-vpc"
  }
}
 
# Create 1 public subnets for each AZ within the regional VPC
resource "aws_subnet" "public" {
  for_each = var.public_subnet_numbers
 
  vpc_id            = aws_vpc.vpc.id
  availability_zone = each.key
 
  # 2,048 IP addresses each
  cidr_block = cidrsubnet(aws_vpc.vpc.cidr_block, 4, each.value)
 
  tags = {
    Name        = "demo-${var.infra_env}-public-subnet"
    Role        = "public"
    Environment = var.infra_env
    ManagedBy   = "terraform"
    Subnet      = "${each.key}-${each.value}"
  }
}
 
# Create 1 private subnets for each AZ within the regional VPC
resource "aws_subnet" "private" {
  for_each = var.private_subnet_numbers
 
  vpc_id            = aws_vpc.vpc.id
  availability_zone = each.key
 
  # 2,048 IP addresses each
  cidr_block = cidrsubnet(aws_vpc.vpc.cidr_block, 4, each.value)
 
  tags = {
    Name        = "demo-${var.infra_env}-private-subnet"
    Role        = "private"
    Environment = var.infra_env
    ManagedBy   = "terraform"
    Subnet      = "${each.key}-${each.value}"
  }
}