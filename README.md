# Environment Setup

1. Install [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)
2. Install [Azure Function Core Tools](https://docs.microsoft.com/en-us/azure/azure-functions/functions-run-local?tabs=v4%2Cmacos%2Ccsharp%2Cportal%2Cbash#v2)
3. Install [tfswitch](https://github.com/warrensbox/terraform-switcher) to be able to install and use any Terraform version at anytime

# Project Structure
```
.
├── LICENSE
├── README.md
├── infra <- Code that will setup the infrastructure on Azure
│   ├── main.tf
│   ├── resources.tf
│   └── variables.tf
└── src
    └── example-ts-function <- Code of a Typescript Azure Function
        ├── host.json
        ├── local.settings.json 
        ├── package.json
        ├── say-goodbye <- Setting a trigger and input/output bindings for a specific usage of the function 
        │   └── function.json
        ├── say-hello <- Another trigger and bindings
        │   └── function.json
        └── tsconfig.json
```
# Azure CLI Login

# Azure Infrastructure with Terraform

// TODO

# Azure Function

// TODO
