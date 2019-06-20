module "iam" {
  source = "./modules/iam"
}

module "network" {
  source = "./modules/vpc"

  vpc_cidr = var.vpc_cidr
  public_subnet_cidr = var.nextcloud_cidr
  private_subnet_cidr = var.db_cidr

  instance_id = module.nextcloud-app.nextcloud_core_instance_id
}

module "nextcloud-app" {
  source = "./modules/services/nextcloud-app"

  aws_region = var.aws_region
  instance_type = var.nextcloud_instance_type
  key_name = var.nextcloud_key_name

  vpc_id = module.network.vpc_id
  subnet_id = module.network.public_subnet_id

  admin_user = var.admin_user
  admin_pass = var.admin_pass

  db_user = var.db_user
  db_pass = var.db_pass
  db_name = module.database.db_name
  db_endpoint = module.database.db_endpoint

  s3_bucket_name = var.s3_bucket_name
  s3_access_key = module.iam.nextcloud_iam_user_access_key
  s3_secret_key = module.iam.nextcloud_iam_user_secret_key
}

module "database" {
  source = "./modules/data/mysql"

  db_user = var.db_user
  db_pass = var.db_pass

  vpc_id = module.network.vpc_id
  public_subnet_cidr = var.nextcloud_cidr
  subnet_id = module.network.private_subnet_id
  subnet_group = module.network.subnet_group
}

module "datastore" {
  source = "./modules/data/s3"

  s3_bucket_name = var.s3_bucket_name
  nextcloud_iam_user_arn = module.iam.nextcloud_iam_user_arn
  terraform_iam_user_arn = module.iam.terraform_iam_user_arn

  force_destroy = var.force_datastore_destroy
}
