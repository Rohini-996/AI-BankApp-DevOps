# Get default VPC
data "aws_vpc" "default" {
  default = true
}

# Get available subnets
data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
}

# Create EKS Cluster
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.0"

  name               = var.cluster_name
  kubernetes_version = var.cluster_version

  # Cluster access
  endpoint_public_access  = true
  endpoint_private_access = true

  enable_cluster_creator_admin_permissions = true

  # Essential EKS Add-ons
  addons = {
    coredns = {}

    kube-proxy = {}

    vpc-cni = {
      before_compute = true
    }
  }

  # Default VPC networking
  vpc_id     = data.aws_vpc.default.id
  subnet_ids = data.aws_subnets.default.ids

  # Managed Node Group
  eks_managed_node_groups = {
    eks-node-group = {
      instance_types = [var.instance_type]

      desired_size = var.desired_size
      min_size     = var.min_size
      max_size     = var.max_size

      ami_type  = "AL2023_x86_64_STANDARD"
      disk_size = 20
    }
  }

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}
