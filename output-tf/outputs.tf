# produces an output value named "container_id"
output "container_id" {
  description = "ID of the Docker container"
  value       = docker_container.nginx.id
}
# produces an output value named "image_id"
output "image_id" {
  description = "ID of the Docker image"
  value       = docker_image.nginx.id
}
#produces an output value named "container_id"
output "hostname" {
  description = "hostname of the Docker container"
  value       = docker_container.nginx.hostname
}
## produces an output value named "image_id"
output "repo_digest" {
  description = "repo_digest of the Docker image"
  value       = docker_image.nginx.repo_digest
}
