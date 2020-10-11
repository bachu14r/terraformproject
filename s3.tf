resource "aws_s3_bucket" "bucket" {
  bucket = var.my_rs3_bucket
  acl    = "private"

  tags = {
    Name        = var.my_rs3_bucket
    Environment = "terraform.workspace"
  }
}

resource "aws_s3_bucket" "alb_access_logs" {
  bucket = "rdemo-alb-access-logs"
  policy = "${data.template_file.rdemo.rendered}"
  acl    = "public"

  tags = {
    Name        = "ralb-access-logs"
    Environment = "terraform.workspace"
  }
}
