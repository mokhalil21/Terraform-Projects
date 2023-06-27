# create vpc
resource "aws_vpc" "vpc" {

    cidr_block               = var.vpc_cidr 
    instance_tenancy         =  "default"
    enable_dns_hostnames     = true

    tags        = {
      Name      = "dev_vpc"
    }
}

# create internet gateway and attatch it to vpc 
resource "aws_internet_gateway" "internet_gateway" {

    vpc_id      = aws_vpc.vpc.id

    tags        = {
        Name    = "dev_internet_gateway"
    } 
  
}

# create public subnet az1
resource "aws_subnet" "public_subnet_az1" {
    vpc_id                   = aws_vpc.vpc.id       
    cidr_block               = var.public_subnet_az1_cidr
    availability_zone          = "us-east-1a"
    map_public_ip_on_launch  = true

    tags = {
      Name = "public_subnet_az1"
    }
}

# create public subnet az2
resource "aws_subnet" "public_subnet_az2" {
    vpc_id                   = aws_vpc.vpc.id       
    cidr_block               = var.public_subnet_az2_cidr
    availability_zone          = "us-east-1b"
    map_public_ip_on_launch  = true

    tags = {
      Name = "public_subnet_az2"
    }
}

# create route table and public route
resource "aws_route_table" "public_route_table" {

    vpc_id               = aws_vpc.vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.internet_gateway.id
    }

    tags         = {
      
      Name       = "public_route_table"

     }

    }

    #assosiate public subnet in az1 with the public route 

    resource "aws_route_table_association" "Public_subnet_az1_route_table_assosiation" {

        subnet_id = aws_subnet.public_subnet_az1.id
        route_table_id = aws_route_table.public_route_table.id
      
    }


    #assosiate public subnet in az2 with the public route 


    resource "aws_route_table_association" "Public_subnet_az2_route_table_assosiation" {

        subnet_id = aws_subnet.public_subnet_az2.id
        route_table_id = aws_route_table.public_route_table.id
      
    }

    # create private app subnet in az1

    resource "aws_subnet" "private_app_subnet_az1" {

        vpc_id                   = aws_vpc.vpc.id
        cidr_block               =  var.private_app_subnet_az1_cidr
        availability_zone        =  "us-east-1a"     
        map_public_ip_on_launch  = false

        tags = {
          
          Name = "private app subnet az1"
        }
    }

    # create private app subnet in az2

    resource "aws_subnet" "private_app_subnet_az2" {

        vpc_id                   = aws_vpc.vpc.id
        cidr_block               = var.private_app_subnet_az2_cidr
        availability_zone        = "us-east-1b"     
        map_public_ip_on_launch  = false

        tags = {
          
          Name = "private app subnet az2"
        }
    }

    # create private database subnet az1
    resource "aws_subnet" "private_database_subnet_az1" {

        vpc_id                   = aws_vpc.vpc.id
        cidr_block               = var.private_database_subnet_az1_cidr
        availability_zone        = "us-east-1a"     
        map_public_ip_on_launch  = false

        tags = {
          
          Name = "private database subnet az1"
        }
    }

     # create private database subnet az2
    resource "aws_subnet" "private_database_subnet_az2" {

        vpc_id                   = aws_vpc.vpc.id
        cidr_block               = var.private_database_subnet_az2_cidr
        availability_zone        = "us-east-1b"     
        map_public_ip_on_launch  = false

        tags = {
          
          Name = "private database subnet az2"
        }
    }







  



