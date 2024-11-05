# Two-Tier-Architecture-Project

![Two-Tier-Architechture](https://github.com/user-attachments/assets/0594f027-f25e-4803-b554-298c40721f6b)

# Set up Environment
I used `aws configure` to set up my credentials for security best practices. 

# Set up Provider
In my case, I used AWS as a provider. For configuration, you can refer to [provider.tf](https://github.com/Itsmejerryy/Two-Tier-Architecture/blob/main/providers.tf)

# Create VPC, Subnets, Internet Gateway and Route Tables
- To isolate the infrastructures from others, you need a vpc. You can refer to [vpc.tf](https://github.com/Itsmejerryy/Two-Tier-Architecture/blob/main/vpc.tf)
- Create Subnets in different Availability Zones - [subnets.tf](https://github.com/Itsmejerryy/Two-Tier-Architecture/blob/main/subnets.tf)
- Create Internet Gateway - [internet-gateway.tf](https://github.com/Itsmejerryy/Two-Tier-Architecture/blob/main/internet-gateway.tf)
- Create a Route Table for public subnets and Associate to them - [route-table.tf](https://github.com/Itsmejerryy/Two-Tier-Architecture/blob/main/route-table.tf)

# Create Security Group
To allow traffic between resources, we need to establish connections. The security group will permit the necessary connections for all resources.
- EC2 instance security group - [sg.tf](https://github.com/Itsmejerryy/Two-Tier-Architecture/blob/main/sg.tf)
- ELB security group - [lb-sg.tf](https://github.com/Itsmejerryy/Two-Tier-Architecture/blob/main/lb-sg.tf)
- RDS security group - [rds-sg.tf](https://github.com/Itsmejerryy/Two-Tier-Architecture/blob/main/rds-sg.tf)

# Create EC2 Instances
note: I have a key pair ready. But its optional since I dont need to access ec2 instances
Create Instances with user data to be deployed in different Availability Zones - [ec2.tf](https://github.com/Itsmejerryy/Two-Tier-Architecture/blob/main/ec2.tf)

# Create Load Balancer and its Configurations
- Create a target group first to target the Instances - [target-group.tf](https://github.com/Itsmejerryy/Two-Tier-Architecture/blob/main/target-group.tf)
- Create Application Load Balancer to distribute traffic across instances - [alb.tf](https://github.com/Itsmejerryy/Two-Tier-Architecture/blob/main/alb.tf)

# Create Database in Private Subnet
Create Subnet Group first - [subnet-grp.tf](https://github.com/Itsmejerryy/Two-Tier-Architecture/blob/main/subnet-grp.tf)
Create RDS as a Database - [rds.tf](https://github.com/Itsmejerryy/Two-Tier-Architecture/blob/main/rds.tf)

# Provide Varaiable values
I separated the variable resources from actual values as well as the credentials of database for better management.
- Variable Resources - [varaibles.tf](https://github.com/Itsmejerryy/Two-Tier-Architecture/blob/main/varaibles.tf)
- Variable Values - [terraform.tfvars](https://github.com/Itsmejerryy/Two-Tier-Architecture/blob/main/terraform.tfvars) and [secret.tfvars](https://github.com/Itsmejerryy/Two-Tier-Architecture/blob/main/secret.tfvars)

# Getting the DNS name of Load Balancer
[output.tf](https://github.com/Itsmejerryy/Two-Tier-Architecture/blob/main/output.tf)

# Execution and Result
* TERRAFORM PLAN using `terraform plan -var-file="secret.tfvars"`
* then APPLY using `terraform apply -var-file="secret.tfvars" -auto-approve`
* After Terraform finishes the execution, DNS name of the load balancer will be outputted paste it to your browser
  ![image](https://github.com/user-attachments/assets/184bcd0c-5a11-4822-aa3f-cfba109fc5ca)

* If you reload it several times, you will see how the distribution of load across different availability zones.
  ![image](https://github.com/user-attachments/assets/4e53f3a7-6603-4c9e-8f4a-864060383c17)

  ![image](https://github.com/user-attachments/assets/8dba9c05-0acd-487e-9905-f76370a17b70)

* Finally Destroy using  `terraform destroy -var-file="secret.tfvars" -auto-approve` to avoid unwanted charges.








