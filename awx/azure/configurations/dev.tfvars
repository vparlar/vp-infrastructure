# Below code is used to set backend only
s3_bucket                       =       "acirrustech-iaac"
s3_folder_region                =       "us-east-1"











# Please do not change below
s3_folder_type                  =       "tools"
user                            =       "ansible" 
key_name                        =       "ansible"
ssh_key_location                =       "~/.ssh/id_rsa"
ssh_pub_key			=	"~/.ssh/id_rsa.pub"
environment                     =       "tools"
s3_tfstate_file                 =       "azure.tfstate"
s3_folder_project               =       "azure"
location                =   "westus2"
address_space           =   "10.0.0.0/16"
vnet_name               =   "dev1"
resource_group_name     =   "dev"                                                         
security_group_name     =   "sec_group1"
vm1_computername        =   "vm1"
vm2_computername        =   "vm2"
vm3_computername        =   "vm3"
private_subnet1_range   =   "10.0.1.0/24"
private_subnet2_range   =   "10.0.2.0/24"
private_subnet3_range   =   "10.0.3.0/24"
#OS Information
publisher               =   "OpenLogic"
offer                   =   "CentOS"
sku                     =   "7.5"
os_version              =   "latest"
admin_username          =   "centos"
vm_size                 =   "Standard_DS1_v2"
