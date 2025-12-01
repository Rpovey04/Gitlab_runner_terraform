data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-*"]
  }
}

data "aws_key_pair" "SSH-key" {
  count = var.ssh_key_name == "na" ? 0 : 1
  key_name           = var.ssh_key_name
  include_public_key = true
}

resource "aws_instance" "server" {
  for_each = toset(var.gitlab_runner_tokens) 
  ami = data.aws_ami.ubuntu.id
  instance_type = var.gitlab_runner_instance_type
  associate_public_ip_address = "true"
  key_name                    = var.ssh_key_name == "na" ? null : data.aws_key_pair.SSH-key[0].key_name
  tags = {
    Name = "${substr(each.key, 0, 12)}_runner_instance"
  }
  # arch hard coded in since only the ubuntu ami is provided in this file
  user_data = templatefile("${path.module}/init_runner.sh", { arch = "amd64", url = var.gitlab_runner_url, token = each.key, executor = var.gitlab_runner_executor})
}
