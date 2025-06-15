resource "aws_instance" "Bastion" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id =  module.mynetwork.subnets["PublicSubnet2"].id
  associate_public_ip_address = true
  vpc_security_group_ids = [module.mynetwork.Bastion_sg]
  key_name = aws_key_pair.public_key_pair.key_name
  tags = {
    Name = "Bastion"
  }
}

resource "aws_instance" "Reverse_proxy" {
  count                  = 2
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  subnet_id              = module.mynetwork.subnets["PrivateSubnet${count.index + 1}"].id
  vpc_security_group_ids = [module.mynetwork.worker_sg]
  key_name               = aws_key_pair.public_key_pair.key_name

  tags = {
    Name = "jenkins-reverse-${count.index + 1}"
  }
}

resource "aws_instance" "backend" {
  count                  = 2
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  subnet_id              = module.mynetwork.subnets["PrivateSubnet${count.index + 3}"].id
  vpc_security_group_ids = [module.mynetwork.backend_sg]
  key_name               = aws_key_pair.public_key_pair.key_name
  tags = {
    Name = "backend-${count.index + 1}"
  }
}