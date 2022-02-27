# Rancher Example

This repo contains the source code for an EKS blueprint which demonstrates how to deploy Rancher on EKS. 

## Usage 

### Update Locals 

Update `locals.tf` with your desired values. Required values to update are 

```
# Must be a domain for a Route53 zone that exists in your AWS account. Rancher URL will be https://rancher.<cluster_domain>.
cluster_domain              = "<cluster_domain>"
rancher_bootstrap_password  = "<rancher_password>"
lets_encrypt_email          = "<lets_encrypt_email"
```

### Deploy the Blueprint

Note, below we deploy specific modules individually for simplicity. In a production setting, we would want each module to have its own state file and be applied independently. Modules must be applied in the order specified below. 

```
terraform init
terraform apply -target=module.vpc
terraform apply -target=module.eks_cluster
terraform apply -target=module.add_ons
```

## Debugging 

Rancher Helm will often get stuck when attempting to delete. See debugging tips in the issue below.

https://github.com/rancher/rancher/issues/14715
