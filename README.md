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

### creating or understanding modules 

```
fire@ashutoshhs-MacBook-Air tff % mkdir modules 
fire@ashutoshhs-MacBook-Air tff % mkdir modules/websevers
fire@ashutoshhs-MacBook-Air tff % mkdir modules/databases
fire@ashutoshhs-MacBook-Air tff % 
```


### terraform for managing container based infra 

```
[root@ip-172-31-16-36 containers]# cat  main.tf 
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.20.0"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

```

###  launching image and creating contaienr 

```
[root@ip-172-31-16-36 containers]# cat  image.tf 
resource "docker_image" "myimg" {

	name = "oraclelinux:8.4"

}


resource "docker_container" "ashuc1" {

	name = "myc1"
	image = "${docker_image.myimg.name}"
	command = [ "sleep","100" ]

}

```


