#resource "aws_ami_copy" "nextcloud_ami" {
#  name              = "nextcloud-core-ubuntu"
#  description       = "Latest Ubuntu Bionic LTS"
#  source_ami_id     = data.aws_ami.ubuntu_bionic_lts.id
#  source_ami_region = var.aws_region
#}

data "aws_ami" "ubuntu_bionic_lts" {
  most_recent = true
  owners = ["099720109477"]

  filter {
    name = "name"

    values = [
      "ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server*",
    ]
  }
}