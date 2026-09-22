# Project
## Architecture

https://github.com/Prasannakurapati9/azure-3tier-infrastructure-terraform-devops/blob/main/Tier3%20-%20Azure%20Arch.png

# Azure 3-Tier Infrastructure Automation

Infrastructure-as-Code project demonstrating the deployment and management
of a secure Azure 3-tier application architecture using Terraform and
Azure DevOps.

## Technologies

- Microsoft Azure
- Terraform
- Azure DevOps
- Azure Networking
- Azure Load Balancer
- Azure Storage
- Private Endpoint
- Private DNS
- Azure Key Vault
- Azure Monitor
- Log Analytics
- NSG
- ASG
- Git
- PowerShell

## Architecture

Internet
   |
   v
Azure Load Balancer
   |
   v
Web Tier
IIS VM / VMSS
   |
   v
Application Tier
   |
   v
Database Tier

Additional Azure services:

- Storage Account
- Private Endpoint
- Private DNS
- Key Vault
- Azure Monitor
- Log Analytics

Terraform state is managed separately from application infrastructure.

## Project Objectives

- Build Azure infrastructure using Terraform
- Follow Infrastructure-as-Code practices
- Separate infrastructure into reusable Terraform modules
- Implement Azure network segmentation
- Configure NSGs and ASGs
- Configure Azure Load Balancer
- Secure PaaS access using Private Endpoint
- Implement Azure monitoring
- Integrate Terraform with Azure DevOps CI/CD
- Demonstrate infrastructure troubleshooting
- Follow least-privilege and secret-management practices

## Terraform Structure

The Terraform configuration is organized into modules:

- Network
- Compute
- Load Balancer
- Storage
- Key Vault
- Monitoring

The root module passes required values to child modules using variables
and consumes infrastructure IDs through module outputs.

## CI/CD Workflow

Developer
   |
   v
Git Repository
   |
   v
Azure DevOps Pipeline
   |
   +--> Terraform Format
   |
   +--> Terraform Validate
   |
   +--> Terraform Plan
   |
   +--> Approval
   |
   +--> Terraform Apply
   |
   v
Azure Infrastructure

## Security

- Network segmentation using subnets
- Network Security Groups
- Application Security Groups
- Private Endpoint
- Private DNS
- Azure Key Vault
- Managed Identity
- RBAC
- No secrets committed to Git
- Least-privilege access

## Monitoring

- Azure Monitor
- Log Analytics
- Monitoring workspace
- Alerts
- Infrastructure monitoring

## Troubleshooting Scenarios

The project also includes hands-on troubleshooting for:

- NSG connectivity
- Application ports
- Load Balancer health probes
- Private Endpoint connectivity
- DNS resolution
- Azure Storage access
- Terraform state
- Terraform drift
- Azure quota issues

## Disclaimer

This is a personal hands-on portfolio project created to demonstrate
Azure, Terraform and DevOps skills. Production migration experience
described separately in my professional experience is not represented
as part of this lab project.
