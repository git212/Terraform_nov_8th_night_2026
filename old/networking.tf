resource "aws_vpc" "main"{
    cidr_block = var.vpc_cidr
    tags ={
        "Name" = "aws-iac-16"
        "Department" = "Training"
    }
}

resource "aws_subnet" "main"{
  count = length(var.subnet_cidrs)
  vpc_id = aws_vpc.main.id
  cidr_block = var.subnet_cidrs[count.index]
  availability_zone = local.az_names[count.index]
}


resource "aws_internet_gateway" "main" {
    vpc_id = aws_vpc.main.id
  
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id


  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "example"
  }
}

# Subnet association

resource "aws_route_table_association" "public1" {
  count = length(local.sub_ids)
  subnet_id      = local.sub_ids[count.index]
  route_table_id = aws_route_table.public.id
}

