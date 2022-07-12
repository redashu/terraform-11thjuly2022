# terraform-11thjuly2022

### day1 revision 

<img src="rev.png">


### creating keypair in ec2 service 

<img src="key.png">

### keygen method 

```
# resource for choose algo method 
resource "tls_private_key" "ashusecret" {
    algorithm = "RSA"
    rsa_bits = 4096 
  
}

resource "aws_key_pair" "ashugen_key" {
    key_name = "ashu_key111"
    public_key = tls_private_key.ashusecret.public_key_openssh
    # above method will store public key in cloud env 
    provisioner "local-exec" {
        command = "echo '$tls_private_key.ashusecret.private_key_pem' >./ashu.pem"
      
    }
  
}

```

### ec2-instances creation 

```
#        resource name   ref name 
resource "aws_instance" "ashuvm2" {

    ami = "ami-098e42ae54c764c35"
    instance_type = "t2.micro"
    tags = {
      "Name" = "ashulinuxvm-tf"
    }
    key_name = "ashu_key111"
  
}


```

### listing state --

```
fire@ashutoshhs-MacBook-Air terraform_code % terraform state list                      
aws_instance.ashuvm2
aws_key_pair.ashugen_key
tls_private_key.ashusecret
fire@ashutoshhs-MacBook-Air terraform_code % 
fire@ashutoshhs-MacBook-Air terraform_code % 
fire@ashutoshhs-MacBook-Air terraform_code % terraform state show aws_instance.ashuvm2 
```

### adding output section 

```
#        resource name   ref name 
resource "aws_instance" "ashuvm2" {

    ami = "ami-098e42ae54c764c35"
    instance_type = "t2.micro"
    tags = {
      "Name" = "ashulinuxvm-tf"
    }
    key_name = "ashu_key222"
  
}

output "ashuout" {
  value = "${aws_instance.ashuvm2.public_ip}  and my instance id is ${aws_instance.ashuvm2.id}"
}


```




### use this link for HCL code

[click_here](https://codeshare.io/JbNLKZ)




