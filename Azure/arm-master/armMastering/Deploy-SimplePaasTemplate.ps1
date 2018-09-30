### Define Deployment Variables
{
$location = 'West Europe'
$resourceGroupName = 'contoso-simple-paas-template'
$resourceDeploymentName = 'contoso-paas-template-deployment'
<<<<<<< HEAD
$templatePath = $env:SystemDrive + '\' + 'Acca\github_repos\devOps-Learning\Azure\arm-master\armMastering'
=======
$templatePath = $env:SystemDrive + '\' + 'Acca\github\devOps-Learning\Azure\arm-master\armMastering'
>>>>>>> 4b59dbb2089bd7d4f6adcc111d286539cd283aed
$templateFile = 'simplePaas.json'
$template = $templatePath + '\' + $templateFile
}

### Create Resource Group
{
New-AzureRmResourceGroup `
    -Name $resourceGroupName `
    -Location $location `
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