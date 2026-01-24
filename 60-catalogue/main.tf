#create EC@ instance
resource "aws_instance" "catalogue" {
  ami           =local.ami_id
  instance_type = "t3.micro"
  vpc_security_group_ids =[local.catalogue_sg_id]
  subnet_id=local.private_subnet_ids
  tags = merge(
    local.common_tags,{
        Name="${local.common_name_suffix}-catalogue" #roboshop-dev-mongodb
    }
  )
  
}

# connect to instance using remote-exec provisioner through terraform data or null-resource
resource "terraform_data" "catalogue" { 
  triggers_replace = [
    aws_instance.catalogue.id
  ]
  connection {
type = "ssh"
user = "ec2-user"
password = "DevOps321"
host = aws_instance.catalogue.private_ip
}
#terraform copies this file to  mongodb server
provisioner "file" {
source = "catalogue.sh" # Local file path
destination = "/tmp/catalogue.sh" # Destination on EC2


}
provisioner "remote-exec" {
    inline=[
        "chmod +x /tmp/catalogue.sh",
        # "sudo sh /tmp/bootstrap.sh"
        "sudo sh /tmp/catalogue.sh catalogue ${var.environment}"

    ]
  }
}

#stop the instance to take image
resource "aws_ec2_instance_state" "catalogue" {
instance_id = aws_instance.catalogue.id
state       = "stopped"  # Set to "stopped" to stop the instance
depends_on = [ terraform_data.catalogue ]
}
resource "aws_ami_from_instance" "catalogue" {
  name               = "${local.common_name_suffix}-catalogue-ami"
  source_instance_id = aws_instance.catalogue.id
  depends_on = [ aws_ec2_instance_state.catalogue ]
  tags = merge(
    local.common_tags,{
        Name="${local.common_name_suffix}-catalogue-ami" #roboshop-dev-mongodb
    }
  )
  
}