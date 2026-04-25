variable "aws_region" {
  type        = string
  description = "The AWS region to deploy into"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "vpc_name" {
  type        = string
  description = "Name of the VPC"
}

variable "private_subnet" {
  type        = string
  description = "List of private subnet CIDRs"
}

variable "public_subnet" {
  type        = string
  description = "List of public subnet CIDRs"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type for the Auto Scaling Group"
}

variable "name_prefix" {
  type        = string
  description = "Prefix for naming AWS resources"
}

variable "db_engine" {
  type        = string
  description = "Database engine for RDS"
}

variable "db_engine_version" {
  type        = string
  description = "Version of the DB engine"
}

variable "db_family" {
  type        = string
  description = "db family version"
}

variable "db_instance_class" {
  type        = string
  description = "RDS instance class"
}

variable "db_allocated_storage" {
  type        = number
  description = "Allocated storage for RDS instance (in GB)"
}

variable "db_username" {
  type        = string
  description = "Master DB username"
}

variable "db_password" {
  type        = string
  description = "Master DB password"
  sensitive   = true
}

variable "db_subnet" {
  type        = string
  description = "List of db subnet CIDRs"
}