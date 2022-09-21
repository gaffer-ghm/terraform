terraform {
  cloud {
    organization = "gaffer"

    workspaces {
      name = "my-example"
    }
  }
}
