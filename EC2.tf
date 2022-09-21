resource "aws_instance" "elasticsearch_server" {
  ami           = data.aws_ami.elasticsearch_ubuntu1.id
  instance_type = "m4.large"
  #security group
  vpc_security_group_ids = [aws_security_group.elasticseach_sg.id]
  key_name = "talent_acedamy_lab"
  subnet_id = data.aws_subnet.private_a.id
  tags = {
    Name = "elasticsearch_server"
  }
}
#resource "aws_eip" "elasticsearch_server_ip" {
#  instance = aws_instance.elasticsearch_server.id
#  vpc      = true
#}



resource "aws_instance" "logstach_server" {
  ami           = data.aws_ami.logstach_ubuntu1.id
  instance_type = "m4.large"
  #security group
  vpc_security_group_ids = [aws_security_group.logstach_sg.id]
  key_name = "talent_acedamy_lab"
  subnet_id = data.aws_subnet.private_a.id
  tags = {
    Name = "logstach-server"
  }
}
#resource "aws_eip" "logstach_server_ip" {
#  instance = aws_instance.logstach_server.id
#  vpc      = true
#}



resource "aws_instance" "kibana_server" {
  ami           = data.aws_ami.kibana_ubuntu1.id
  instance_type = "m4.large"
  #security group
  vpc_security_group_ids = [aws_security_group.kibana_sg.id]
  key_name = "talent_acedamy_lab"
  subnet_id = data.aws_subnet.public_a.id
  tags = {
    Name = "kibana-server"
  }
}
resource "aws_eip" "kibana_server_ip" {
  instance = aws_instance.kibana_server.id
  vpc      = true
}


resource "aws_instance" "demo1_server" {
  ami           = data.aws_ami.filebeat_ubuntu1.id
  instance_type = "t3.medium"
  #security group
  vpc_security_group_ids = [aws_security_group.demo_sg.id]
  key_name = "talent_acedamy_lab"
  subnet_id = data.aws_subnet.private_a.id
  tags = {
    Name = "demo1-server"
  }
}
#resource "aws_eip" "demo1_server_ip" {
#  instance = aws_instance.demo1_server.id
 # vpc      = true
#}


resource "aws_instance" "demo2_server" {
  ami           = data.aws_ami.filebeat_ubuntu1.id
  instance_type = "t3.medium"
  #security group
  vpc_security_group_ids = [aws_security_group.demo_sg.id]
  key_name = "talent_acedamy_lab"
  subnet_id = data.aws_subnet.private_b.id
  tags = {
    Name = "demo2-server"
  }
}
#resource "aws_eip" "demo2_server_ip" {
#  instance = aws_instance.demo2_server.id
 # vpc      = true
#}


resource "aws_instance" "demo3_server" {
  ami           = data.aws_ami.filebeat_ubuntu1.id
  instance_type = "t3.medium"
  #security group
  vpc_security_group_ids = [aws_security_group.demo_sg.id]
  key_name = "talent_acedamy_lab"
  subnet_id = data.aws_subnet.private_c.id
  tags = {
    Name = "demo3-server"
  }
}
#resource "aws_eip" "demo3_server_ip" {
 # instance = aws_instance.demo3_server.id
 # vpc      = true
#}


resource "aws_instance" "bastion_host_ami" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.medium"
  vpc_security_group_ids = [aws_security_group.bastion_host_server_sg.id]
  key_name = "talent_acedamy_lab"
  subnet_id = data.aws_subnet.public_a.id
  tags = {
    Name = "Bastion_host"
  }
 }
resource "aws_eip" "Bastion_host_ip" {
  instance = aws_instance.bastion_host_ami.id
  vpc      = true
}