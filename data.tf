data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  owners = ["099720109477"] # Canonical
}

data "aws_ami" "ubuntu_ami" {
  filter {
    name = "tag:Name"
    values = ["kibana_ami"]
  }
}


data "aws_vpc" "elk_vpc1" {
    filter {
      name = "tag:Name"
      values =["elk_vpc1"]
    }
}

resource "aws_internet_gateway" "internet_gateways" {
  #vpc_id = aws_vpc.elk_vpc1.id

  tags = {
    Name = "internet_gateways"
  }
}

resource "aws_eip" "eip" {
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


