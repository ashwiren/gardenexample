resource "random_password" "test_password" {
  length           = 20
  special          = true
  min_special      = 5
  override_special = "#-_=+"
}
