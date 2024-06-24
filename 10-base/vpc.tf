module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.8.1"

  name = "base-vpc"
  cidr = "10.0.0.0/16"

  azs              = ["us-east-1d", "us-east-1e", "us-east-1f"]
  private_subnets  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets   = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
  database_subnets = ["10.0.21.0/24", "10.0.22.0/24", "10.0.23.0/24"]
  intra_subnets    = ["10.0.51.0/24", "10.0.52.0/24", "10.0.53.0/24"]

  enable_nat_gateway                   = true
  enable_vpn_gateway                   = true
  single_nat_gateway                   = true
  one_nat_gateway_per_az               = false
  enable_flow_log                      = true
  create_flow_log_cloudwatch_iam_role  = true
  create_flow_log_cloudwatch_log_group = true
  flow_log_cloudwatch_log_group_retention_in_days = 7

  tags = {
    Terraform   = "true"
    Environment = "platform"
  }
}

