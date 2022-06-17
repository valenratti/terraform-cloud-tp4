module "lambda_vpc" {
  source = "../modules/vpc"

  providers = {
    aws = aws.aws
  }

  vpc_name                  = local.vpc_name
  vpc_cidr_block            = local.vpc_cidr_block
  vpc_private_subnet_name   = local.vpc_private_subnet_name
  private_subnet_cidr_block = local.private_subnet_cidr_block

}