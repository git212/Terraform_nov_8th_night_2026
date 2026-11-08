variable "ami_id" {
  description = "AMI ID to use for the EC2 instance."
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type."
  type        = string
}

variable "subnet_id" {
  description = "Subnet in which to launch the instance."
  type        = string
}

variable "vpc_id" {
  description = "VPC in which to create the instance security group."
  type        = string
}

variable "ingress_rules" {
  description = "Inbound security group rules keyed by rule name."
  type = map(object({
    port        = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = {}
}

variable "instance_name" {
  description = "Name tag for the EC2 instance."
  type        = string
  default     = "ec2-instance"
}

variable "security_group_name" {
  description = "Name of the instance security group."
  type        = string
  default     = "ec2-instance"
}

variable "associate_public_ip_address" {
  description = "Whether to associate a public IP address with the instance."
  type        = bool
  default     = true
}

variable "key_name" {
  description = "Optional EC2 key pair name."
  type        = string
  default     = null
}

variable "tags" {
  description = "Additional tags to apply to the EC2 instance and security group."
  type        = map(string)
  default     = {}
}
