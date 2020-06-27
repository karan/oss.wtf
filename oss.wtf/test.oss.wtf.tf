resource "google_dns_record_set" "test-oss-wtf" {
  name         = "test.oss.wtf."
  managed_zone = "oss-wtf"
  type         = "A"
  ttl          = 300

  rrdatas = ["156.154.133.20"]
}
