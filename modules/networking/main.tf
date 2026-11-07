resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
}

# create subnets
resource "aws_subnet" "public" {
  count = var.subnet_count
  vpc_id = aws_vpc.main.id
  availability_zone = local.az_names[count.index]
  cidr_block = var.pub_cidrs[count.index]
}

# create internet gateway
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
}
# create public route table
resource "aws_route_table" "public" {
 vpc_id = aws_vpc.main.id
 route {
    cidr_block        = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
}

# subnet association
resource "aws_route_table_association" "public" {
  count = length(aws_subnet.public.*.id)
  subnet_id      = aws_subnet.public.*.id[count.index]
  route_table_id = aws_route_table.public.id
}
