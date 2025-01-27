variable "aws_region" {
  type        = string
  default     = "us-west-1"
  description = "AWS region where EKS will be deployed"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  type        = string
  description = "Name for demo VPC"
  default     = "eks-vpc"
}

variable "aws_azs" {
  type        = list(string)
  description = "Available regions for VPC"
  default     = ["us-west-1a", "us-west-1b"]
}
variable "public_subnets" {
  type        = list(string)
  description = "CIDRs for public subnets"
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets" {
  type        = list(string)
  description = "CIDRs for private subnets"
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "cluster_name" {
  type        = string
  description = "Name for the EKS cluster"
  default     = "demo-eks-cluster"
}

variable "cluster_version" {
  type        = string
  description = "Kubernetes version for the EKS cluster in Stage"
  default     = "1.27"
}

variable "desired_node_count" {
  type        = number
  description = "Number of worker nodes"
  default     = 3
}

variable "instance_type" {
  type        = string
  description = "Instance type for worker nodes"
  default     = "t3.medium"
}