#        resource name   ref name 
resource "aws_instance" "ashuvm1" {

    ami = "ami-098e42ae54c764c35"
    instance_type = "t2.micro"
    tags = {
      "Name" = "ashulinuxvm-tf"
    }
    key_name = "ashukey"
  
}

