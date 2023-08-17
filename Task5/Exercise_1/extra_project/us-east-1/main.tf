module "vpc" {
  source                        = "../modules/vpc"
  vpc_name                      = "udacity_vpc_east"
  vpc_cidr_block                = "10.1.0.0/16"
  vpc_public_subnet_cidr_block  = "10.1.10.0/24"
  vpc_private_subnet_cidr_block = "10.1.20.0/24"
}

module "app_servers" {
  source                     = "../modules/app_servers"
  instance_name              = "Udacity T2 East"
  subnet                     = module.vpc.vpc_public_subnet_id
  app_server_security_groups = ["${module.vpc.app_server_security_group_id}"]
  availability_zone          = "us-east-1a"
  count                      = 4
}

module "static_file_storage" {
  source      = "../modules/static_file_storage"
  bucket_name = "udacity-static-east"
}
