# module "eks" {
#   source  = "terraform-aws-modules/eks/aws"
#   version = "~> 20.0"

#   name               = local.cluster_name
#   kubernetes_version = "1.30"

#   # Optional
#   endpoint_public_access = true
#   enable_cluster_creator_admin_permissions = true

#   # Optional: Adds the current caller identity as an administrator via cluster access entry
#   #   enable_cluster_creator_admin_permissions = true


#   vpc_id     = module.vpc.vpc_id
#   subnet_ids = module.vpc.private_subnets

#   eks_managed_node_groups = {
#     one = {
#       name          = "node-group1"
#       instance_type = ["t3.small"]
#       ami_type      = "AL2_x86_64"

#       min_size     = 1
#       max_size     = 3
#       desired_size = 2
#     }

#     two = {
#       name          = "node-group2"
#       instance_type = ["t3.small"]
#       ami_type      = "AL2_x86_64"

#       min_size     = 1
#       max_size     = 4
#       desired_size = 3
#     }
#   }

#   tags = {
#     Environment = "dev"
#     Terraform   = "true"
#   }
# }

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  # Updated Argument Names
  cluster_name    = local.cluster_name
  cluster_version = "1.30"

  # Networking
  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  # Updated Argument Name
  cluster_endpoint_public_access = true

  # This allows your current IAM user to access the cluster via Console/CLI
  enable_cluster_creator_admin_permissions = true

  eks_managed_node_groups = {
    one = {
      name         = "node-group1"
      instance_types = ["t3.small"]

      min_size     = 1
      max_size     = 3
      desired_size = 2
    }

    two = {
      name         = "node-group2"
      instance_types = ["t3.small"]

      min_size     = 1
      max_size     = 4
      desired_size = 3
    }
  }

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}