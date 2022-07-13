resource "aws_ebs_volume" "ashuvolume" {
    availability_zone = var.avzone
    size = var.ebs_size
  
}