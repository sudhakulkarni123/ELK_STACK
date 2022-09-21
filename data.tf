data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  owners = ["099720109477"] # Canonical
}

data "aws_ami" "elasticsearch_ubuntu1" {
  most_recent = true
  owners      = ["312415305792"]

  filter {
    name   = "name"
    values = ["elasticsearch_server1"]
  }
}

data "aws_ami" "kibana_ubuntu1" {
  most_recent = true
  owners      = ["312415305792"]

  filter {
    name   = "name"
    values = ["kibana_server1"]
  }
}

data "aws_ami" "logstach_ubuntu1" {
  most_recent = true
  owners      = ["312415305792"]

  filter {
    name   = "name"
    values = ["logstach_server1"]
  }
}

data "aws_ami" "filebeat_ubuntu1" {
  most_recent = true
  owners      = ["312415305792"]

  filter {
    name   = "name"
    values = ["filebeat_server1"]
  }
}

data "aws_vpc" "elk_vpc" {
    filter {
      name = "tag:Name"
      values =["elk_vpc"]
    }
}

resource "aws_internet_gateway" "internet_gateway" {
  #vpc_id = aws_vpc.elk_vpc.id

  tags = {
    Name = "internet_gateway"
  }
}

resource "aws_eip" "nat_eip" {
  vpc = true
}
 
data "aws_subnet" "public_a" {
    filter {
      name = "tag:Name"
      values =["public"]
    }
} 

data "aws_subnet" "private_a" {
    filter {
      name = "tag:Name"
      values =["private_a"]
    }
} 

data "aws_subnet" "private_b" {
    filter {
      name = "tag:Name"
      values =["private_b"]
    }
} 

data "aws_subnet" "private_c" {
    filter {
      name = "tag:Name"
      values =["private_c"]
    }
} 


