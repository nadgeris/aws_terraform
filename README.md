**#AWS_Terraform**

**#Purpose**

This is where you configure and maintain all new environments as Infrastructure as Code.

Pre-requirements: 

Terragrunt: 

Terragrunt is a thin wrapper that provides extra tools for keeping your configurations DRY, working with multiple Terraform modules, and managing remote state.

Every env has a definitions.yaml file, where I have defined the veriable

Please update the veriable according to your env



**#NETWORK**

i] VPC will be created.

ii] 4 private subnet groups with multi AZ (APP, RDS, Monitoring, ALB) will be created.

iii] 4 public subnet groups with muti AZ (APP, RDS, Monitoring, ALB) will be created.

iv] 1 NAT gateway for private subnet will be created.

v] 1 Internet gateway for public subnet will bw created.

**#RDS**

i] RDS will be launched in RDS subnet

ii] security group will be created for RDS

iii] python script (create db, create table and create the entery)will get executed and record will be created.


**#APP**
i] app will be launched in app subnet.

ii] security group will be created for the app.

iii] flask app will get deployed.


**Deployment steps **

**(i) Deploy network**

cd root/1234567890/env/network/vpc/

terragrunt run-all init

terragrunt run-all plan

terragrunt run-all apply


**(ii) Deploy RDS**

cd root/1234567890/env/rds/

terragrunt run-all init

terragrunt run-all plan

terragrunt run-all apply

**(ii) Deploy APP**


cd root/1234567890/env/app/

terragrunt run-all init

terragrunt run-all plan

terragrunt run-all apply

