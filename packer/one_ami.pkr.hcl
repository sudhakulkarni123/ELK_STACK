### AMI FOR ALL INSTANCES 
packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.2"
      source  = "github.com/hashicorp/amazon"
    }
  }
}
locals {
  timestamp = regex_replace(timestamp(), "[- TZ:]", "")
}
source "amazon-ebs" "ubuntu_ami" {
  ami_name          = "Ubuntu22.04-AMI-${local.timestamp}"
  instance_type     = "t3.small"
  region            = "eu-west-1"
  vpc_id            = "vpc-0c1ec49b4574647b6"
  subnet_id         = "subnet-0b9c8018b8c533282"
  security_group_id = "sg-04c4dd0e0fde704e7"
  source_ami_filter {
    filters = {
      name                = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["099720109477"]
  }
  ssh_username = "ubuntu"
  tags = {
    "Name" = "kibana_ami"
  }
}
build {
  name = "Kibana_packer"
  sources = [
    "source.amazon-ebs.ubuntu_ami"
  ]
}