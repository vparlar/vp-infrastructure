# R1soft Module
### This module is used for creating R1soft 
## Prerequisites
1. Terraform 0.11.14

### Steps
## Edit the file below
```
git clone https://github.com/farrukh90/infrastructure.git
cd infrastructure/r1soft/
vi configurations/r1soft.tfvars
```

```
source setenv.sh configurations/r1soft.rfvars 
terraform apply -var-file configurations/r1soft.rfvars 






