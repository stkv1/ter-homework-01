terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      #version = "~> 3.0"
    }
  }
  required_version = ">=1.12.0"
}
provider "docker" {
  host = var.docker_host
}

resource "random_password" "random_string" {
  length      = 16
  special     = false
  min_upper   = 1
  min_lower   = 1
  min_numeric = 1
}

resource "docker_image" "mysql-image" {
  name         = "mysql:8"
  keep_locally = true
}

resource "docker_container" "nginx" {
  name  = "netology-mysql-8-3306"
  image = docker_image.mysql-image.image_id

  env = [
    "MYSQL_ROOT_PASSWORD=${random_password.random_string.result}",
    "MYSQL_DATABASE=wordpress",
    "MYSQL_USER=wordpress",
    "MYSQL_PASSWORD=${random_password.random_string.result}",
    "MYSQL_ROOT_HOST=localhost",
  ]

  ports {
    internal = 3306
    external = 3306
  }
}
