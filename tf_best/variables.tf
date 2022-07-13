variable "ami_id" {
    type = string
    description = "here we are keeping ami-id to create ec2-instance"
    default = "ami-098e42ae54c764c35"
  
}

variable "instance_type" {
    type = string
    description = "type of ec2 resources "
    default = "t2.micro"
  
}

variable "my_key" {
    type = string
    description = "my personal private key for ec2"
    default = "helloashu"
  
}

variable "avzone" {
    type = string
    description = "setting av zone for your instance and EBS both"
    default = "us-west-2b"
  
}

variable "ebs_size" {
    type =  number
    description = "size of ebs volume"
    default = 2 
  
}