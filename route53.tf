data "aws_route53_zone" "rdemo" {
  name         = "rdemo.ne"
  private_zone = false
}

resource "aws_route53_record" "rdemo" {
  zone_id = "${data.aws_route53_zone.rdemo.zone_id}"
  name    = "${data.aws_route53_zone.rdemo.name}"
  type    = "A"

  alias {
    name                   = "${aws_elb.rdemo_elb.dns_name}"
    zone_id                = "${aws_elb.rdemo_elb.zone_id}"
    evaluate_target_health = false
  }
}
