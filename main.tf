module "vpc" {
  source = "./modules/neworking" 
  infra_env = dev
  vpc_cidr  = "10.0.0.0/17"
}

module "s3" {
    source = "./modules/storage"
    bucket_name = "mcterraform670389"       
}

module "ec2_app" {
   source = "./modules/compute"
   instance_size = "t3.small"
   instance_ami = data.aws_ami.app.id
}
 