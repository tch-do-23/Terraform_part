provider "github" {
  token = var.github_token
}


resource "github_repository" "tch-do23" {
  name        = "final_project"
  visibility  = "private"
  description = "My private repository"

}
