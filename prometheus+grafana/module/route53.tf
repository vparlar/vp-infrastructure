resource "aws_route53_record" "prometheus" {
  zone_id = "${var.zone_id}"
  name    = "prometheus.${var.domain}"   
  type    = "A"
  ttl     = "60"
  records = ["${aws_instance.prometheus.public_ip}"]
}
