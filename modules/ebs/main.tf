resource "aws_ebs_volume" "example" {
  availability_zone = "us-east-1a"
  size              = 1

  tags = {
    Name = "ebs-terra"
  }
}
resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.example.id
  instance_id = aws_instance.web.id
}

resource "aws_instance" "web" {
  ami               = "ami-08982f1c5bf93d976"
  availability_zone = "us-east-1a"
  instance_type     = "t2.micro"

  tags = {
    Name = "ebs-terra"
  }
}

