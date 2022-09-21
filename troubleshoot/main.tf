
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.13.0"
    }
  }
}

provider "docker" {}
  
resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = true
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.latest
  name  = var.container_name
  ports {
    internal = 80
    external = 8089
  }
}

output "container_id" {
  description = "ID of the Docker container"
  value       = docker_container.nginx.id
}

output "image_id" {
  description = "ID of the Docker image"
  value       = docker_image.nginx.id
}


# produces an output value named "container_id"
#output "container_id" {
  #description = "ID of the Docker container"
  #value       = docker_container.nginx.id
#}
# produces an output value named "image_id"
#output "image_id" {
  #description = "ID of the Docker image"
  #value       = docker_image.nginx.id
#}
#produces an output value named "container_id"
#output "hostname" {
  #description = "hostname of the Docker container"
  #value       = docker_container.nginx.hostname
#}
### produces an output value named "image_id"
#output "repo_digest" {
  #description = "repo_digest of the Docker image"
  #value       = docker_image.nginx.repo_digest
#}
