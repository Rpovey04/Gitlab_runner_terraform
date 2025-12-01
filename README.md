Need to define the following variables:

- gitlab_runner_url: usually just https://gitlab.com [default="https://gitlab.com"]
- gitlab_runner_tokens: tokens obtained by creating a new gitlab runner, must be given as an array (["glrt-..."] for a single runner) 
- gitlab_runner_executor: executor used by the runner [default="docker", alpine image used as default]
- gitlab_runner_instance_type: aws ec2 instance type used to host the runner [default="t3.micro"]

The following can be optionally defined:

- ssh_key_name: Name of the SSH key associated with the newly created runner (must be in the same aws account where the instances are being deployed). Leaving blank will result in no key being associated

Recommended to define variables (especially tokens) in a persistent tfvars file to allow for the destruction of runners later
