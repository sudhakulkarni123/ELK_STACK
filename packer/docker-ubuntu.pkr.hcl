packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.7"
      source  = "github.com/hashicorp/amazon"
    }
  }
}
source "amazon-ebs" "elasticsearch_server1" {
  ami_name          = "elasticsearch_server1"
  instance_type     = "m4.large"
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
    owners      = ["312415305792"]
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

source "amazon-ebs" "logstach_server1" {
  ami_name          = "logstach_server1"
  instance_type     = "m4.large"
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
    owners      = ["312415305792"]
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


source "amazon-ebs" "kibana_server1" {
  ami_name          = "kibana_server1"
  instance_type     = "m4.large"
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
    owners      = ["312415305792"]
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


source "amazon-ebs" "filebeat_server1" {
  ami_name          = "filebeat_server1"
  instance_type     = "m4.large"
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
    owners      = ["312415305792"]
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
