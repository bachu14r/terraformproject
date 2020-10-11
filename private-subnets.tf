resource "aws_subnet" "private" {
  count      = length(slice(local.az_names, 0, 2))
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "${cidrsubnet(var.vpc_cidr, 8, count.index + length(local.az_names))}"
  availability_zone ="${local.az_names[count.index]}"

  tags = {
    Name = "privatesubnet-${count.index + 1}"
  }
}

resource "aws_nat_gateway" "ngw" {
  allocation_id = "eipalloc-0728b4fb1c2b2abe4"
  subnet_id     = local.pub_sub_ids[0]

  tags = {
    Name = "rdemonat"
  }
}

resource "aws_route_table" "privatert" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.ngw.id
  }

  tags = {
    Name = "rdemoprivatert"
  }
}

resource "aws_route_table_association" "private_rt_association" {
  count          = "${length(slice(local.az_names, 0, 2))}"
  subnet_id      = aws_subnet.private.*.id[count.index]
  route_table_id = aws_route_table.privatert.id
  }
