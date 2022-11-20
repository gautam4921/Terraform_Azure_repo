resource "aws_ebs_volume" "ebsvolume" {
  availability_zone = "us-east-2a"
  size = 10
  encrypted = false
  tags = {
    Name = "azterravol"
  }

}

resource "aws_instance" "azterraec2" {
  ami = "ami-0cbf975b93d9cd3f9"
  instance_type = "t2.micro"
  subnet_id = "subnet-092cdeac13b36beb4"
  vpc_security_group_ids = ["sg-039e7f1a6a983f220"]
  user_data = <<-EOF
      #!/bin/sh
      sudo apt-get update && sudo apt upgrade -y 
      sudo apt install -y apache2
      sudo systemctl status apache2
      sudo systemctl start apache2
      EOF
  associate_public_ip_address = true
  key_name = "ubu-ohio-kp"
  availability_zone = "us-east-2a"
  tags = {
    Name = "ec2-terraform"
  }
}
resource "aws_volume_attachment" "mountvolumetoec2" {
  device_name = "/dev/sdb"
  instance_id = aws_instance.azterraec2.id
  volume_id = aws_ebs_volume.ebsvolume.id
}
