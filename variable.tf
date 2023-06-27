# vpc variables
variable "vpc_cidr" {
    default         = "10.0.0.0/16"
    description     = "vpc_cidr_block"
    type            = string
  }

variable "public_subnet_az1_cidr" {
    default         = "10.0.0.0/24"
    description     = "public_subnet_az1_cidr_block"
    type            = string
  }

  variable "public_subnet_az2_cidr" {
    default         = "10.0.1.0/24"
    description     = "public_subnet_az2_cidr_block"
    type            = string
  }

  variable "private_app_subnet_az1_cidr" {
    default         = "10.0.2.0/24"
    description     = "private_subnet_az1_cidr_block"
    type            = string
  }

  variable "private_app_subnet_az2_cidr" {
    default         = "10.0.3.0/24"
    description     = "private_subnet_az2_cidr_block"
    type            = string
  }

  variable "private_database_subnet_az1_cidr" {
    default         = "10.0.4.0/24"
    description     = "private_database_az1_cidr_block"
    type            = string
  }
  variable "private_database_subnet_az2_cidr" {
    default         = "10.0.5.0/24"
    description     = "private_database_az2_cidr_block"
    type            = string
  }


 variable "ssh_location" {
    default         = "your-ip"
    description     = "the ip that has access to ssh into the bastion"
    type            = string
  }

# rds variables

variable "database_snapshot_idnf" {
    default         = "arn:aws:rds:us-east-1:786646628536:snapshot:fleet-cart-snapshot"
    description     = "database snapshot arn"
    type            = string
  }
variable "database_instance_class" {
    default         = "db.t2.micro"
    description     = "database instance type"
    type            = string
  }

variable "database_instance_idn" {
    default         = "rds-db"
    description     = "database snapshot idntifier"
    type            = string
  }
  # multi AZ

  variable "multi_az_deployment" {
    default         = false 
    description     = "create a standby db instance"
    type            = bool
  }
  
    variable "ssl_certifcate_arn" {
    default         = "arn:aws:acm:us-east-1:786646628536:certificate/e9869564-56a1-44c8-b5ed-96710e6a6f2e"
    description     = "ssl-certifcate-arn"
    type            = string
  }
  
  variable "sns_topic_email" {
    default         = "your desire email"
    description     = "sns-email"
    type            = string
  }

    variable "asg-launch-template" {
    default         = "dev-launch-template"
    description     = "name of the launch tample"
    type            = string
  }


    variable "ec2-image-id" {
    default         = "ami-0e31f1f8acd7ac458"
    description     = "id of the ami"
    type            = string
  }

  variable "ec2-instance-type" {
    default         = "t2.micro"
    description     = "the ec2 instance type "
    type            = string
  }

 variable "ec2-key-pair" {
    default         = "Fleet"
    description     = "key-pair-name"
    type            = string
  }

