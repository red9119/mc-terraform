resource "aws_instance" "demo_instance" {
  ami           = var.instance_ami
  instance_type = var.instance_size
 
  root_block_device {
    volume_size = var.instance_root_device_size
    volume_type = "gp3"
  }`
}
 
resource "aws_eip" "demo_instance_addr" {
  vpc      = true
 
  lifecycle {
    prevent_destroy = true
  }
}
 
resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.demo_instance.id
  allocation_id = aws_eip.demo_instance_addr.id
}