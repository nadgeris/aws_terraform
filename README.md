**#AWS_Terraform**

**#Purpose**
This is where you configure and maintain all new environments as Infrastructure as Code.

PreReq's
Every env has a definitions.yaml, where I have defined the veriable

Please update the veriable according your env



**#NETWORK**

i] VPC will be created.

ii] 4 private subnets group with muti AZ (APP, RDS, Monitoring, ALB)

iii] 4 public subnets group with muti AZ (APP, RDS, Monitoring, ALB)

iv] 1 NAT gateway for private subnet

v] 1 Internet gateway for public subnet

**#RDS**

i] RDS will get launch in RDS subnet

ii] security group

iii] python script (create db, create table and create the entery)


**#APP**
i] app will launch in app subnet.

ii] security group.

iii] flask app will get deploy.


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

