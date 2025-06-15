module "mynetwork" {
    source = "./network"
    vpc_cidr_m = var.vpc_cidr
    subnets_m = var.subnets
    region_m = var.region

}