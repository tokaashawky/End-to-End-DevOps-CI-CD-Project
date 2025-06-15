module "vpc" {
  source   = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
  vpc_name = var.vpc_name
}

module "subnets" {
  source  = "./modules/subnets"
  vpc_id  = module.vpc.vpc_id
  subnets = var.subnets
}

module "igw" {
  source   = "./modules/igw"
  vpc_id   = module.vpc.vpc_id
  igw_name = "devops-igw"
}

locals {
  public_subnet_ids = {
    for k, id in module.subnets.subnet_ids : k => id if can(regex("public", k))
  }

  private_subnet_ids = {
    for k, id in module.subnets.subnet_ids : k => id if can(regex("private", k))
  }
}

module "nat_gateway" {
  source           = "./modules/nat_gateway"
  name             = "devops-nat"
  public_subnet_id = values(local.public_subnet_ids)[0]
  igw_id           = module.igw.igw_id
}

module "route_tables" {
  source             = "./modules/route_tables"
  name               = "devops"
  vpc_id             = module.vpc.vpc_id
  igw_id             = module.igw.igw_id
  nat_gateway_id     = module.nat_gateway.nat_gateway_id
  public_subnet_ids  = local.public_subnet_ids
  private_subnet_ids = local.private_subnet_ids
}

module "sg" {
  source = "./modules/sg"
  vpc_id = module.vpc.vpc_id
}

module "jenkins_ec2" {
  source              = "./modules/ec2"
  name                = "jenkins-server"
  ami_id              = "ami-0c02fb55956c7d316"
  instance_type       = "t3.small"
  subnet_id           = values(local.public_subnet_ids)[0]
  security_group_ids  = [module.sg.jenkins_sg_id]
  key_name            = "my-key"
  associate_public_ip = true
  user_data           = file("${path.module}/scripts/install_jenkins.sh")
}

module "ecr" {
  source                = "./modules/ecr"
  name                  = "devops-app"
  image_tag_mutability  = "IMMUTABLE"
  scan_on_push          = true
}

module "rds" {
  source             = "./modules/rds"
  name               = "devops-db"
  db_name            = "devops"
  username           = "admin"
  password           = "StrongPassword123!"
  subnet_ids         = values(local.private_subnet_ids)
  security_group_ids = [module.sg.rds_sg_id]
}

module "alb" {
  source             = "./modules/alb"
  name               = "devops-alb"
  subnet_ids         = values(local.public_subnet_ids)
  security_group_ids = [module.sg.jenkins_sg_id]
  vpc_id             = module.vpc.vpc_id
  target_port        = 80
}

module "eks" {
  source        = "./modules/eks"
  name          = "devops-eks"
  subnet_ids    = values(local.private_subnet_ids)
  instance_type = "t3.medium"
}
