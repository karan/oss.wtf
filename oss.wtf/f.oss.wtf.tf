resource "google_dns_record_set" "f-oss-wtf" {
  name         = "f.oss.wtf."
  managed_zone = "oss-wtf"
  type         = "A"
  ttl          = 300

  rrdatas = ["1.3.3.7"]
}
