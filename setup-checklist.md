# AWS Foundation — Setup Checklist

Work top to bottom. Check each box as you go.

## Quick Start (do first — ~30–45 min)
- [ ] Root user has **MFA** enabled
- [ ] Root user has **no access keys**
- [ ] Root password is long, unique, in a password manager
- [ ] Account **email inbox** is controlled and has its own MFA
- [ ] A **monthly budget** with an email alert exists
- [ ] **IAM Identity Center** enabled + personal admin user created (with MFA)
- [ ] You can sign in via the **access portal** (not root)
- [ ] **CloudTrail** is turned on

## Accounts & structure
- [ ] **AWS Organizations** enabled (All features)
- [ ] **Production** account created
- [ ] **Development** account created (or planned)
- [ ] Management account runs **nothing but billing/org control**
- [ ] Accounts sorted into **OUs** by function

## Access
- [ ] Permission set(s) created (admin for you; narrower for others)
- [ ] Access assigned per account
- [ ] MFA required for everyone
- [ ] Offboarding step understood (disable Identity Center user)

## Logging & monitoring
- [ ] CloudTrail logging to a **protected** S3 bucket, validation on
- [ ] CloudTrail applied **org-wide** (if using Organizations)
- [ ] (Optional) AWS **Config** enabled
- [ ] (Optional) IAM **Access Analyzer** enabled

## Baseline security
- [ ] **GuardDuty** enabled
- [ ] Plan to store all secrets in **Secrets Manager**
- [ ] Encryption on for storage/databases; HTTPS enforced
- [ ] One **primary Region** chosen
- [ ] (Later) **Security Hub** + **SCP guardrails**

## Cost & credits
- [ ] Cost Explorer enabled
- [ ] (Optional) CloudWatch billing alarm
- [ ] Applied to **AWS Activate** for startup credits

---
**Foundation complete when the Quick Start + Accounts + Access + Logging sections are all checked.**
