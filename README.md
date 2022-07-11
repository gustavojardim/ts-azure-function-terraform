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

# Steps to Run this Function as Is

### Login to Azure with CLI Login

Login to Azure with Azure CLI command `az login`

### Setup Azure Infrastructure with Terraform

1. Run `terraform validate && terraform fmt` to validate your infra configuration and format the files
2. `terraform init` to prepare the working directory so Terraform can run the configuration
3. `terraform plan` to preview any changes before you apply them
4. `terraform apply` to create or update infrastructure

### Package (zip) the Function and Send it to Azure

Inside your function root folder, run:

1. `npm run build && zip -r <name-of-your-choice>.zip .`
2. `az functionapp deployment source config-zip -g <resource-group-name -n <function-app-name> --src ./<package-name>.zip --debug`

You can lately save these commands as NPM commands.

# To Setup new Azure Function from Scratch

1. Inside the **src** folder, execute the command `func init <MyFunctionName>`
2. Select the worker runtime, in this case **Node**
3. Select the language, so **Typescript**
4. Once the function directory is created, navigate to it with `cd <DirName>` and create a new directory with a standard name, like `mkdir http-trigger`
5. Navigate to your new dir and create a function definition file with `touch function.json`
