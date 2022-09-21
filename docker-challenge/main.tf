# Docker Challenge main.tf
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.13.0"
      #source  = "alta3research/simpleflaskservice"
      #version = "~> 1.0"
    }
  }
}

#https://gitlab.com/alta3research/simpleflaskservice

provider "docker" {}

resource "docker_image" "simpleflaskservice" {
  #name         = "simpleflaskservice:1.0"
  name         = "registry.gitlab.com/alta3research/simpleflaskservice:1.0"
  keep_locally = true    // keep image after "destroy"
}

resource "docker_container" "simpleflaskservice" {
  image = docker_image.simpleflaskservice.latest
  # here we removed the name "tutorial" for the container
  # and replace it with a call to a variable
  # name  = "tutorial"
  name = var.container_name
  ports {
    # internal and external are now defined by variables
    internal = var.internal_port
    external = var.external_port
  }
}
