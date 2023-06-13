# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}

  client_id       = "5883c1e6-ab0f-4a84-bfca-79f88779229d"
  client_secret   = "${var.client_secret}"
  tenant_id       = "638fcbaf-ba4c-43e1-adae-5475c970fe10"
  subscription_id = "0fc7c31e-92f7-4e21-a24d-c003a52a926f"
}

# create rg
resource "azurerm_resource_group" "example" {
  
  name     =              "azpoc-neu-vptest-rg02"
  location              = "northeurope"

  # Adding TAG's to your Azure resources (Required)
  # ProjectName and Env are already declared above, to use them here, create a varible. 
  tags = {
    ApplicationSupportDL = "test@tp.com"
    CostCode             = "00"
    CostOwner            = "vp@tp.com"
    Department           = "GCC"
    DeploymentType       = "NN"
    Owner                = "vp@tp.com"
    OwnerSupervisor      = "vp@tp.com"
    ProjectName          = "TF_Test"
    SubsidiaryName       = "Teleperformance Global"
    Stack                = "POC"
    SDTicketNo           = "123456789"
    PatchSchedule        = ""
    DeploymentTag       = "Terraform"
  }
}


# Create a virtual network within the resource group
resource "azurerm_virtual_network" "example" {
  name                = "azpoc-neu-vptest-vnet01"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  address_space       = ["192.168.0.0/24"]

    tags = {
    ApplicationSupportDL = "test@tp.com"
    CostCode             = "00"
    CostOwner            = "vp@tp.com"
    Department           = "GCC"
    DeploymentType       = "NN"
    Owner                = "vp@tp.com"
    OwnerSupervisor      = "vp@tp.com"
    ProjectName          = "TF_Test"
    SubsidiaryName       = "Teleperformance Global"
    Stack                = "POC"
    SDTicketNo           = "123456789"
    PatchSchedule        = ""
    DeploymentTag       = "Terraform"
  }
}