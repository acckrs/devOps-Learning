﻿### Define Deployment Variables
{
$resourceGroupLocation = 'West Europe'
$resourceGroupName = 'contoso-paas'
$resourceDeploymentName = 'contoso-paas-deployment'
$templatePath = $env:SystemDrive + '\' + 'Acca\github\devOps-Learning\Azure\arm-master\armMastering'
$templateFile = 'contosoPaas.json'
$template = $templatePath + '\' + $templateFile
}

### Create Resource Group
{
New-AzureRmResourceGroup `
    -Name $resourceGroupName `
    -Location $resourceGroupLocation `
    -Verbose -Force
}

### Deploy Resources
{
New-AzureRmResourceGroupDeployment `
    -Name $resourceDeploymentName `
    -ResourceGroupName $resourceGroupName `
    -TemplateFile $template `
    -Verbose -Force
}