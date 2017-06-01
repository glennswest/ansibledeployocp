# OCP on Azure - Ansible Deployment of ARM



## Settings and Parameters

### ocpazure settings
The follow files are in a directory ~/.ocpazure/ 
They serve as settings for the running of the ARM template.

aadClientId
Value is from "azure account show"  UserName 
In this example its 22222222-2222-2222-2222-222222222222

aadClientSecret
Value is from the creation of the service principle.
theserviceprinciples password

adminUsername
Value supplied by user. Will by the login for the console account, and the
user for ssh into the bastion.

adminPassword
Value supplied by user. Used for login to console account.

RHNUserName
RHN Organization ID - Numeric

RHNPassword
Name of the activation key

sshPrivateData
A base 64 value, this is created by the setup.sh script from the users private key.

SubscriptionPoolId
The RHN Pool Id to install the customer. 


## Azure Credentials 
Azure credentials are stored in a file at ~/.azure/credentials
The values may be obtained from the azure cli

npm install azure
azure login
azure account show

dhcp-65-33:.ssh gwest$ azure account show
info:    Executing command account show
data:    Name                        : Acme Inc.
data:    ID                          : 00000000-0000-0000-0000-000000000000
data:    State                       : Enabled
data:    Tenant ID                   : 11111111-1111-1111-1111-111111111111
data:    Is Default                  : true
data:    Environment                 : AzureCloud
data:    Has Certificate             : Yes
data:    Has Access Token            : Yes
data:    User name                   : 22222222-2222-2222-2222-222222222222
data:    
info:    account show command OK
dhcp-65-33:.ssh gwest$ 


### ~/.azure/credentials
This file is configured as follows:
[default]
subscription_id=00000000-0000-0000-0000-000000000000
client_id=22222222-2222-2222-2222-222222222222
secret=ServicePrinciplePassword
tenant=22222222-2222-2222-2222-222222222222

## Setup
Before running the ansible deploy for azure, all the dependencies needed for
azure python api must be installed. A script is provided to do so.

### setup.sh script
yum install python2-pip
yum install ansible
yum install python-dev
yum search python | grep dev
yum install python-devel
yum search python | grep dev
yum search openssh | grep dev
yum search openssl | grep dev
yum install openssl-devel
pip install packaging
pip install "azure==2.0.0rc5"
pip install msrestazure
cat ~/.ssh/id_rsa | base64 > ~/.ocpazure/sshPrivateData


## Running the deploy
A Script is provided to run the deploy. run.sh
Or you can directlly type the command.

### run.sh
ansible-playbook deploy.yml
