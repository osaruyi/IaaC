#Define webserver inside public subnet
resource "aws_instance" "uyi_webserver" {
  count                       = "2" #using the count parameter
  ami                         = "ami-0b0a60c0a2bd40612" # eu-west-2b
  instance_type               = "t2.micro"
  key_name                    = " "
  subnet_id                   = "${aws_subnet.uyipubsubnet.id}"
  vpc_security_group_ids      = ["${aws_security_group.uyi_websecgrp.id}"]
  associate_public_ip_address = true
  source_dest_check = false

  connection {
    type     = "ssh"
    user     = "ubuntu"
  }

  provisioner "remote-exec" {
    inline = [ "sudo apt update", "sudo apt -y install apache2" ]
  }

  tags {
    Name = "uyi_webserver"
  }
}

#Define webserver inside private subnet
resource "aws_instance" "uyi_dbserver" {
  count                   = "2" # using the count parameter
  ami                     = "ami-0b0a60c0a2bd40612" # eu-west-2c
  instance_type           = "t2.micro"
  key_name                = " "
  subnet_id               = "${aws_subnet.uyiprisubnet.id}"
  vpc_security_group_ids  = ["${aws_security_group.uyi_dbsecgrp.id}"]
  source_dest_check = false

  tags {
    Name = "uyi_dbserver"
  }
}
