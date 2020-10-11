locals {
  vpc_name = "${terraform.workspace == "dev" ? "rdemo-dev" : "rdemo-prod"}"
}

locals {
  az_names = "${data.aws_availability_zones.azs.names}"
  pub_sub_ids = aws_subnet.public.*.id
}
