module "vpc"{
     source="git::https://github.com/praveenapalla4-creator/terraform-aws-vpc.git?ref=main" #by default main branch a teesukuntundhid specific branch unte mention cheyyachud with ?ref=main
    
    
    #VPC
     vpc_cdir =var.vpc_cdir
    project_name =var.project_name
    environment = var.environment
    vpc_tags =var.vpc_tags
    #public subnets
    public_subnet_cidrs = var.public_subnet_cidrs
    #private subnets
    private_subnet_cidrs = var.private_subnet_cidrs
    #database subnets
    database_subnet_cidrs = var.database_subnet_cidrs
    is_peering_required = true
}

