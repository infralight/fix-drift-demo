resource "cloudflare_record" "docs-1e4" {
  name    = "docs"
  proxied = false
  ttl     = 1
  type    = "A"
  value   = "192.168.123.23"
  zone_id = "05bd8086c243124f3ba0edbef2ebb844"
}

