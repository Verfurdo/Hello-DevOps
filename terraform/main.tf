terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

resource "docker_image" "hello_devops" {
  name = "verfurdo/hello-devops:latest"
}

resource "docker_container" "hello_container" {
  name  = "hello-devops-container"
  image = docker_image.hello_devops.image_id

  ports {
    internal = 5173
    external = 5174
  }
}
