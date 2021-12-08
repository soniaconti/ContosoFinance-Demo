# Introduction 

In this project we will create a Website using Azure App Service.


#  What is Azure App Service?

Azure App Service is a Platform as a Service (PaaS), in other words it is a fully managed platform used for hosting web applications, like this one below, Mobile Apps, Logic Apps, API Apps and Function Apps.


# Why Should you use Infrastructure as Code?

Infrastructure as code (IaC) enables you to automatically provision your environment with no manual intervention. For this demo we use JSON however the same resources can be deployed using different languages such as Bicep or Terraform.


# Repository Structure 

This repository is made up of three file:
1. **ContosoFinance-Demo-ARM** - contians ARM Templates to deploy resources in Azure
2. **ContosoFinance-Demo-Web** - contains Website code
3. **ContosoFinance-Demo-API** - contains API code

Each file contains the required scirpts and templates to deploy the ContosoFinance Website. In each folder you will also  find a README.md file highlighting what you will need to update if you make any changes to the code.


# Architecture Design

![ArchitectureDesignDiagram](https://github.com/SoniaConti/ContosoFinance-Demo/blob/main/ContosoFinance-Demo-ARM/Images/ArchitectureDesginDiagram.PNG)


# What you will need

To deploy your first website using Azure App Service you will need
1. [Azure Subscription](https://azure.microsoft.com/en-us/free/)
2. [Visual Studio Code](https://code.visualstudio.com/download)
3. [GitHub Repository](github.com)

# Deploy ContosoFinance Web App

1. Clone this repositorary locally.
2. Open [deploy.ps1](https://github.com/SoniaConti/ContosoFinance-Demo/blob/f90588a64800ca5fe0d61391fead516042333bc4/ContosoFinance-Demo-ARM/deploy.ps1) in visual studio code or PowerShell ISE.

    This PowerShell script is the master script that will connect to your azure subscription and deployes all the resouces as shown below. 

![DeploymentDiagram](https://github.com/SoniaConti/ContosoFinance-Demo/blob/main/ContosoFinance-Demo-ARM/Images/DeploymentDiagram.PNG)

3. When running this script the following resouces will show up in the Azure Portal

![DeployedResources](https://github.com/SoniaConti/ContosoFinance-Demo/blob/main/ContosoFinance-Demo-ARM/Images/DeployedResources.PNG)



