resource "aws_security_group" "elasticseach_sg" {
  name        = "elasticseach_server"
  description = "Allow connection for ansible inbound traffic"
  vpc_id      = data.aws_vpc.elk_vpc.id

  ingress {
    description      = "Allow port 9200"
    from_port        = 9200
    to_port          = 9200
    protocol         = "tcp"
    cidr_blocks      = ["192.168.0.0/16"]
    
  }

  ingress {
    description      = "Allow port 22"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["192.168.0.0/16"]
  
  }

  ingress {
    description      = "Allow port 443"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["192.168.0.0/16"]
  
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  tags = {
    Name = "elasticseach_server"
  }
}

resource "aws_security_group" "kibana_sg" {
  name        = "kibana-server"
  description = "Allow connection for ansible inbound traffic"
  vpc_id      = data.aws_vpc.elk_vpc.id

  ingress {
    description      = "Allow port 5601"
    from_port        = 5601
    to_port          = 5601
    protocol         = "tcp"
    cidr_blocks      = ["192.168.0.0/16"]
    
  }

  ingress {
    description      = "Allow port 22"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["192.168.0.0/16"]
  
  }

  ingress {
    description      = "Allow port 443"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["192.168.0.0/16"]
  
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "kibana-server"
  }
}

resource "aws_security_group" "logstach_sg" {
  name        = "logstach-server"
  description = "Allow connection for ansible inbound traffic"
  vpc_id      = data.aws_vpc.elk_vpc.id

  ingress {
    description      = "Allow port 5044"
    from_port        = 5044
    to_port          = 5044
    protocol         = "tcp"
    cidr_blocks      = ["192.168.0.0/16"]
    
  }

  ingress {
    description      = "Allow port 22"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["192.168.0.0/16"]
  
  }

  ingress {
    description      = "Allow port 443"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["192.168.0.0/16"]
  
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "logstach-server"
  }
}

resource "aws_security_group" "demo_sg" {
  name        = "demo1-server"
  description = "Allow connection for ansible inbound traffic"
  vpc_id      = data.aws_vpc.elk_vpc.id

  ingress {
    description      = "Allow port 80"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["192.168.0.0/16"]
    
  }

  ingress {
    description      = "Allow port 22"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["192.168.0.0/16"]
  
  }

  ingress {
    description      = "Allow port 22"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["192.168.0.0/16"]
  
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "demo1-server"
  }
}

#Security group for Bastion Host server
resource "aws_security_group" "bastion_host_server_sg" {
  name        = "bastion-host-server"
  description = "Allow connection for bastion host server."
  vpc_id      = data.aws_vpc.elk_vpc.id
  ingress {
    description = "Allow port 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "bastion-host-server"
  }
}




