<#
 .SYNOPSIS
    Deploys a template to Azure
#>



$subscriptionId = "4ae8209e-3244-4e03-bea5-1967328bb3a9" #insert your subscription ID
$resourceGroupName = "ContosoFinance-Demo-rg"  #provide resource group name
$resourceGroupLocation = "WestEurope"  #location

# The below  file can be used if the templates are stored locally 
#$templateFilePath = "ContosoFinance-Demo-ARM\ARM-Templates\template.json"
#$parametersFilePath = "ContosoFinance-Demo-ARM\ARM-Templates\paramters.json"

$templateFileURI = 'https://github.com/SoniaConti/ContosoFinance-Demo/blob/main/ContosoFinance-Demo-ARM/ARM-Templates/paramters.json'
$parameterFileURI = 'https://github.com/SoniaConti/ContosoFinance-Demo/blob/main/ContosoFinance-Demo-ARM/ARM-Templates/paramters.json'


Function RegisterRP {
    Param(
        [string]$ResourceProviderNamespace
    )

    Write-Host "Registering resource provider '$ResourceProviderNamespace'";
    Register-AzureRmResourceProvider -ProviderNamespace $ResourceProviderNamespace;
}

#******************************************************************************
# Script body
# Execution begins here
#******************************************************************************
$ErrorActionPreference = "Stop"

# sign in
Connect-AzAccount

# select subscription
Write-Host "Selecting subscription '$subscriptionId'";
Select-AzSubscription -SubscriptionID $subscriptionId;

# Register RPs
$resourceProviders = @("microsoft.web");
if($resourceProviders.length) {
    Write-Host "Registering resource providers"
    foreach($resourceProvider in $resourceProviders) {
        RegisterRP($resourceProvider);
    }
}

#Create or check for existing resource group
$resourceGroup = Get-AzResourceGroup -Name $resourceGroupName -ErrorAction SilentlyContinue
if(!$resourceGroup)
{
    Write-Host "Resource group '$resourceGroupName' does not exist. To create a new resource group, please enter a location.";
    if(!$resourceGroupLocation) {
        $resourceGroupLocation = Read-Host "resourceGroupLocation";
    }
    Write-Host "Creating resource group '$resourceGroupName' in location '$resourceGroupLocation'";
    New-AzResourceGroup -Name $resourceGroupName -Location $resourceGroupLocation
}
else{
    Write-Host "Using existing resource group '$resourceGroupName'";
}


# Start the deployment from Remote Template
Write-Host "Starting deployment...";
if(Test-Path $parametersFilePath) {
    New-AzResourceGroupDeployment -ResourceGroupName $resourceGroupName -TemplateUri $templateFileURI -TemplateParameterFile $parametersFileURI -Verbose;
} else {
    New-AzResourceGroupDeployment -ResourceGroupName $resourceGroupName -TemplateFile $templateFileURI-Verbose;
}



<#

# Start the deployment from Local File

Write-Host "Starting deployment...";
if(Test-Path $parametersFilePath) {
    New-AzResourceGroupDeployment -ResourceGroupName $resourceGroupName -TemplateFile $templateFilePath -TemplateParameterFile $parametersFilePath -Verbose;
} else {
    New-AzResourceGroupDeployment -ResourceGroupName $resourceGroupName -TemplateFile $templateFilePath -Verbose;
}

#>