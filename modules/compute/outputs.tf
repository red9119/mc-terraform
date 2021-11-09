output "app_eip" {
  value = aws_eip.demo_instance_addr.public_ip
}
 
output "app_instance" {
    value = aws_instance.demo_instance.id
}