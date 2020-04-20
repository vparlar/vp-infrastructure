data "aws_ami" "ami_image" {
  most_recent = true
  owners      = ["137112412989"]
  filter {
    name   = "state"
    values = ["available"]
  }
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*"]
  }
}




resource "aws_instance" "prometheus" {
  ami           = "${data.aws_ami.ami_image.id}"
  instance_type = "${var.instance_type}"
  key_name     = "${aws_key_pair.prometheus.key_name}"
  iam_instance_profile = "${aws_iam_instance_profile.prometheus_profile.name}"
  security_groups = ["allow_ssh_and_prometheus"]
  provisioner "file" {
    source      = "./module/prometheus.sh"
    destination = "/tmp/prometheus.sh"
    connection {
      host        = "${self.public_ip}"
      type        = "ssh"
      user        = "ec2-user"
      private_key = "${file("~/.ssh/id_rsa")}"
    }
  }
  provisioner "remote-exec" {
    connection {
      host        = "${self.public_ip}"
      type        = "ssh"
      user        = "ec2-user"
      private_key = "${file("~/.ssh/id_rsa")}"
    }

    inline = [
      "chmod +x /tmp/prometheus.sh",
      "sudo bash /tmp/prometheus.sh"
    ]
  }
  tags = {
    Name = "Prometheus"
  }
}


resource "aws_security_group" "allow_ssh_and_prometheus" {
  name        = "allow_ssh_and_prometheus"
  description = "Allow SSH and prometheus"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 9090
    to_port     = 9100
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}