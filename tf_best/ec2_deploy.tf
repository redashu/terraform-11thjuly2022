resource "aws_instance" "ashuvm2" {

    ami = var.ami_id
    instance_type = var.instance_type
    tags = {
      "Name" = "ashunewvmby-tf"
    }
    key_name = var.my_key
    availability_zone = var.avzone # planning ec2 in this avzone 
  
}

resource "aws_volume_attachment" "vol-attach" {
    instance_id = aws_instance.ashuvm2.id
    volume_id = aws_ebs_volume.ashuvolume.id
    device_name = "/dev/sdf"
  
}


