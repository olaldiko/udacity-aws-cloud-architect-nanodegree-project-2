


resource "aws_instance" "udacity_app_instance" {
  ami           = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = var.app_server_security_groups
  availability_zone      = var.availability_zone
}

resource "aws_ebs_volume" "app_servers_storage" {
  availability_zone = var.availability_zone
  size              = 20
  type              = "gp2"
}

resource "aws_volume_attachment" "app_servers_storage_attachment" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.app_servers_storage.id
  instance_id = aws_instance.udacity_app_instance.id
}
