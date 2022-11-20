provider "aws" {
    region = "us-east-2"
    access_key = "AKIARZYTZU2OEDJLMASC"
    secret_key = "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"
    
}
resource "aws_instance" "awsins01" {
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
