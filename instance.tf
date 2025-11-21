data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-*"]
  }
}

data "aws_key_pair" "SSH-key" {
  key_name           = var.ssh_key_name
  include_public_key = true
}

resource "aws_instance" "server" {
  ami = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  associate_public_ip_address = "true"
  key_name                    = data.aws_key_pair.SSH-key.key_name
  tags = {
    Name = "${var.gitlab_runner_url}_runner_instance"
  }
  # arch hard coded in since only the ubuntu ami is provided in this file
  user_data = templatefile("${path.module}/init_runner.sh", { arch = "amd64", url = var.gitlab_runner_url, token = var.gitlab_runner_token})
}
