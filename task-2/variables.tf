variable "docker_host" {
  type        = string
  description = "URL Docker-хоста (например, ssh://user@host или unix:///var/run/docker.sock)"
  default     = "ssh://vm-yandex"
}