provider "aws" {
    region = "us-east-2"
    access_key = "AKIAUSGG6HHLD5BY4UGA"
    secret_key = "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"
    
}
resource "aws_instance" "ec2-terraform-01" {
  ami = "ami-0cbf975b93d9cd3f9"
  instance_type = "t2.micro"  
  subnet_id = "subnet-092cdeac13b36beb4"
  vpc_security_group_ids = ["sg-039e7f1a6a983f220"]
  key_name = "ubu-ohio-kp"
  associate_public_ip_address = true
  count = 2
  tags = {
    "Name" = "ec2-terraform"
  }
}
