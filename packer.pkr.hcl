packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.2"
      source  = "github.com/hashicorp/amazon"
    }
  }
}
source "amazon-ebs" "elasticsearch_server1" {
  ami_name          = "elasticsearch_server1"
  instance_type     = "m4.large"
  region            = "eu-west-1"
  vpc_id            = "vpc-021d86efb317301f9"
  subnet_id         = "subnet-0679d30aa5cbc3ca2"
  security_group_id = "sg-076271814b7679acc"
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
    "Name" = "elasticsearch_server1"
  }
  deprecate_at                = timeadd(timestamp(), "8766h")
  force_deregister            = "true"
  force_delete_snapshot       = "true"
  associate_public_ip_address = true
}
#build {
# name = "elasticsearch_server"
# sources = [
#   "source.amazon-ebs.elasticsearch_server",
# ]
# provisioner "ansible" {
#  playbook_file = "/Users/sudha.kulkarni/src/Talent-Academy/elk_stack/elk_ami_packer/playbook.yml"

# }
#}

source "amazon-ebs" "logstach_server1" {
  ami_name          = "logstach_server1"
  instance_type     = "m4.large"
  region            = "eu-west-1"
  vpc_id            = "vpc-021d86efb317301f9"
  subnet_id         = "subnet-0679d30aa5cbc3ca2"
  security_group_id = "sg-076271814b7679acc"
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
    "Name" = "logstach_server1"
  }
  deprecate_at                = timeadd(timestamp(), "8766h")
  force_deregister            = "true"
  force_delete_snapshot       = "true"
  associate_public_ip_address = true
}
#build {
#  name = "logstach_server"
# sources = [
#   "source.amazon-ebs.logstach_server",
# ]
# provisioner "ansible" {
#   playbook_file = "/Users/sudha.kulkarni/src/Talent-Academy/elk_stack/elk_ami_packer/playbook.yml"

# }
#}


source "amazon-ebs" "kibana_server1" {
  ami_name          = "kibana_server1"
  instance_type     = "m4.large"
  region            = "eu-west-1"
  vpc_id            = "vpc-021d86efb317301f9"
  subnet_id         = "subnet-0679d30aa5cbc3ca2"
  security_group_id = "sg-076271814b7679acc"
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
    "Name" = "kibana_server1"
  }
  deprecate_at                = timeadd(timestamp(), "8766h")
  force_deregister            = "true"
  force_delete_snapshot       = "true"
  associate_public_ip_address = true
}
#build {
# name = "kibana_server"
# sources = [
#  "source.amazon-ebs.kibana_server",
# ]
# provisioner "ansible" {
#   playbook_file = "/Users/sudha.kulkarni/src/Talent-Academy/elk_stack/elk_ami_packer/playbook.yml"

# }
#}


source "amazon-ebs" "filebeat_server1" {
  ami_name          = "filebeat_server1"
  instance_type     = "m4.large"
  region            = "eu-west-1"
  vpc_id            = "vpc-021d86efb317301f9"
  subnet_id         = "subnet-0679d30aa5cbc3ca2"
  security_group_id = "sg-076271814b7679acc"
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
    "Name" = "filebeat_server1"
  }
  deprecate_at                = timeadd(timestamp(), "8766h")
  force_deregister            = "true"
  force_delete_snapshot       = "true"
  associate_public_ip_address = true
}
#build {
# name = "filebeat_server"
# sources = [
#    "source.amazon-ebs.filebeat_server",
#  ]
# provisioner "ansible" {
#  playbook_file = "/Users/sudha.kulkarni/src/Talent-Academy/elk_stack/elk_ami_packer/playbook.yml"

# }
#}

