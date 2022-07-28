# terraform-11thjuly2022

### link to chat 

[chat_here](https://codeshare.io/YLOXbY)

### using data source to find AMI id with filertes and using it 

```
data "aws_ami" "ashuimg" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

}

output "myimgid" {
  value = data.aws_ami.ashuimg.id

}

resource "aws_instance" "ashuvm1" {
  ami           = data.aws_ami.ashuimg.id
  key_name      = "vodakey"
  instance_type = "t2.micro"

}
```

