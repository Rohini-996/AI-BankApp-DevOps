module "ecr" {
  source = "../../modules/ecr"

  repository_name = "ai-bankapp-dev-backend"
  environment     = "dev"
}

module "s3" {
  source = "../../modules/s3"

  bucket_name = "ai-bankapp-dev-assets-996"
  environment = "dev"
}

module "iam" {
  source = "../../modules/iam"

  role_name   = "ai-bankapp-dev-pod-role"
  environment = "dev"
}

module "eks" {
  source = "../../modules/eks"

  cluster_name       = "ai-bankapp-dev"
  kubernetes_version = "1.35"

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.public_subnets

  instance_types = ["t3.large"]
  environment    = "dev"
}

module "vpc" {
  source = "../../modules/vpc"

  vpc_name           = "ai-bankapp-dev-vpc"
  vpc_cidr           = "10.10.0.0/16"
  availability_zones = ["us-east-2a", "us-east-2b"]
  public_subnets     = ["10.10.1.0/24", "10.10.2.0/24"]
  environment        = "dev"
}
