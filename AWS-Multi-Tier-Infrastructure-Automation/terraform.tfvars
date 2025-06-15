vpc_cidr = "10.10.0.0/16"
subnets = [
{
    cidr_block = "10.10.1.0/24"
    availability_zone = "us-east-1a"
    name = "PublicSubnet1"
    type = "public"  
},
{
    cidr_block = "10.10.2.0/24"
    availability_zone = "us-east-1b"
    name = "PublicSubnet2"
    type = "public"  
},
{
    cidr_block = "10.10.3.0/24"
    availability_zone = "us-east-1a"
    name = "PrivateSubnet1"
    type = "private"  
},
{
    cidr_block = "10.10.4.0/24"
    availability_zone = "us-east-1b"
    name = "PrivateSubnet2"
    type = "private"   
},
{
    cidr_block = "10.10.5.0/24"
    availability_zone = "us-east-1a"
    name = "PrivateSubnet3"
    type = "private"  
},
{
    cidr_block = "10.10.6.0/24"
    availability_zone = "us-east-1b"
    name = "PrivateSubnet4"
    type = "private"   
},
{
    cidr_block = "10.10.7.0/24"
    availability_zone = "us-east-1a"
    name = "PrivateSubnet5"
    type = "private"  
},
{
    cidr_block = "10.10.8.0/24"
    availability_zone = "us-east-1b"
    name = "PrivateSubnet6"
    type = "private"   
}
]
region = "us-east-1"
instance_type = "t2.micro"

db_username = "toka"
db_password = "Zayton_812"
db_instance_class = "db.t3.micro" 
db_S_class = "gp2" 
