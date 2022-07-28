resource "aws_instance" "webvm" {
    ami = data.aws_ami.ashuimg.id 
    instance_type = var.instance_type
    key_name = var.my_key
    tags = {
      "Name" = "ashuvm-009"
    }
    user_data = <<EOF
                #!/bin/bash
                apt update 
                apt install apache2 docker -y 
                echo "hello world" >/var/www/html/index.html
                systemctl start docker 
                EOF 
  
}