locals {
  common_tags = {
    name = var.project
    environment = var.environment
    terraform = true

  }
  
}