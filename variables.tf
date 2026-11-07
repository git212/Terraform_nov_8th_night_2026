variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "subnet_cidrs" {
  default = ["10.0.0.0/24"]
}

variable "region" {
  default = "us-east-1"
}

variable "ami_id" {
  default = "ami-0b245cc5f82576748"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "web_sg_rules" {
  type = map(object({
    port = number
    protocol = string
    cidr_blocks = list(string)
  }))
  default = {
    "80" = {
      port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}