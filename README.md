### Azure Certs for Management
Create Azure Management Key/PEM
```openssl req -x509 -nodes -days 365 -newkey rsa:1024 -keyout ~/.ssh/azure-management.pem -out ~/.ssh/azure-management.pem```

Extract cert from PEM for upload to Azure
```openssl x509 -inform pem -in ~/.ssh/azure-management.pem -outform der -out ~/.ssh/azure-management.cer```

### Azure Certs per VM
Create an RDP Key/PEM for each box
```openssl req -x509 -nodes -days 365 -newkey rsa:1024 -keyout ~/.ssh/azure-box01.pem -out ~/.ssh/azure-box01.pem```

### Environment Variables

Specify the current VM's options by setting the following environment variables.

AZURE_MANAGEMENT_CERT = path/to/management/cert
AZURE_SUBSCRIPTION = subscription id
AZURE_IMAGE = a699494373c04fc0bc8f2bb1389d6106__Windows-Server-2012-R2-201502.01-en.us-127GB.vhd
AZURE_BOX_USERNAME = portaj
AZURE_BOX_PASSWORD = pasword
AZURE_BOX_NAME = box01
AZURE_ZONE = "West US"
AZURE_BOX_PEM = /path/to/boxes/pm
AZURE_SERVICE_NAME = "service-name"
AZURE_DEPLOYMENT_NAME = "deployment-name"

### Dependencies
- vagrant-azure plugin
