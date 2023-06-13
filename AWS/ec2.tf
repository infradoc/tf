provider "aws" {
  region     = "ap-south-1"
  access_key = "AKIAWBCC2FYEC2FMV7VV"
  secret_key = "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"
}

resource "aws_instance" "vpec2" {
    ami = "ami-06c2ec1ceac22e8d6"
    instance_type = "t2.micro"

    tags = {
        Name = "vp_ec2"
    }
}