variable "ami" {
  default = "ami-0fe630eb857a6ec83"
}
variable "instance-type" {
  type    = list(any)
  default = ["t2.micro", "t2.small", "t3a.medium", "t2.nano"]

}

variable "ports" {
  type = list(any)

}
variable "github_token" {

}
