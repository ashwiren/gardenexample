output "test_password" {
  value     = random_password.test_password.result
  sensitive = true
}
