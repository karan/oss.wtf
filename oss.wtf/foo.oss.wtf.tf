resource "google_dns_record_set" "foo-oss-wtf" {
  name         = "foo.oss.wtf."
  managed_zone = "oss-wtf"
  type         = "A"
  ttl          = 300

  rrdatas = ["1.3.3.7"]
}
