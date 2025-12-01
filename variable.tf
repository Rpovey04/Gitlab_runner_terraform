variable "gitlab_runner_url" {
	type = string
	description = "Target url for the runner"
  default = "https://gitlab.com"
}

variable "gitlab_runner_tokens" {
	type = list
	description = "Tokens used to initialise the runner"
}

variable "ssh_key_name" {
  type = string
  description = "Name of ssh key to add to instance on aws"
  default = "na"
}

variable "gitlab_runner_executor" {
  type = string
  description = "Executor used by the runner"
  default = "docker"
}

variable "gitlab_runner_instance_type" {
  type = string
  description = "Type of AWS EC2 instance used to host the gitlab runner"
  default = "t3.micro"
}
