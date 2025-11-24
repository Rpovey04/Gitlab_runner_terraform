variable "gitlab_runner_url" {
	type = string
	description = "Target url for the runner"
  default = "https://gitlab.com"
}

variable "gitlab_runner_token" {
	type = string
	description = "Token used to initialise the runner"
}

variable "ssh_key_name" {
  type = string
  description = "Name of ssh key to add to instance on aws"
}

variable "gitlab_runner_executor" {
  type = string
  description = "Executor used by the runner"
  default = "shell"
}
