output "myimgid" {
  value = data.aws_ami.ashuimg.id

}

output "vm-details" {
    value = "${aws_instance.webvm.id} and ${aws_instance.webvm.public_ip}"
  
}