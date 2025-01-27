# Define modules and EKS configurations

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.16.0"

  name                 = var.vpc_name
  cidr                 = var.vpc_cidr
  azs                  = var.aws_azs
  public_subnets       = var.public_subnets
  private_subnets      = var.private_subnets
  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Terraform     = true
    "Environment" = "Stage"
  }

  vpc_tags = {
    Name = var.vpc_name
  }
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.31.1"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  cluster_endpoint_public_access = true

  eks_managed_node_groups = {
    default = {
      min_size       = var.desired_node_count
      max_size       = var.desired_node_count + 2
      desired_size   = var.desired_node_count
      instance_types = [var.instance_type]
    }
  }

  tags = {
    "Environment" = "stage"
  }
}