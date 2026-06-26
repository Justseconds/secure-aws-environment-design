# Terraform Starter (optional, advanced)

This automates three of the foundation pieces instead of clicking them:
- a **monthly budget** with an email alert
- a **CloudTrail** audit log (plus its protected S3 bucket)
- **GuardDuty** threat detection

> **New to AWS? Skip this folder.** The `docs/` guide covers the manual way, which is the better place to start. Come back here when you (or a developer) want repeatable, version-controlled infrastructure.

## Prerequisites
- [Terraform](https://developer.hashicorp.com/terraform/install) installed.
- AWS credentials available locally — easiest via IAM Identity Center: run `aws sso login` (see `docs/04`).
- You're targeting the account/region you intend (double-check before applying).

## Use
```bash
cd terraform
terraform init
# Review what it will create — ALWAYS read the plan before applying:
terraform plan -var="alert_email=you@yourcompany.com"
# If it looks right:
terraform apply -var="alert_email=you@yourcompany.com"
```

Set variables in `terraform.tfvars` instead of the command line if you prefer:
```hcl
alert_email   = "you@yourcompany.com"
budget_amount = "50"
aws_region    = "us-east-1"
```

## To remove everything this created
```bash
terraform destroy
```

## Notes
- This is intentionally minimal and single-account. Organizations, Identity Center, and SCPs are better set up via the console/AWS docs and aren't included here.
- Review every `plan` output before `apply`. You are responsible for what runs in your account.
