# 06 — Baseline Security Services

**Goal:** turn on automated threat detection and a few sensible defaults, so security isn't all manual.
**Time:** ~15 minutes.

## Step 1 — GuardDuty (automated threat detection)
GuardDuty watches your account for suspicious activity (e.g., a stolen credential being used from a strange location) and raises findings.
1. Go to **GuardDuty** → **Enable GuardDuty**.
2. If using Organizations, enable it for the whole org from the management account (or a delegated security account).
3. It's **free for 30 days**, then a small usage-based cost. Worth it.

## Step 2 — Secrets Manager (no secrets in code)
Any password, API key, or token your app needs goes in **AWS Secrets Manager**, never hard-coded in your code or committed to GitHub.
1. **Secrets Manager** → **Store a new secret** when you have one.
2. Your application reads it at runtime via its IAM role.

## Step 3 — Encryption defaults
- **S3:** new buckets are encrypted at rest by default — keep it on, and never make a bucket public unless you truly intend to.
- **Databases (DynamoDB/RDS):** enable encryption at rest (KMS) when you create them.
- **In transit:** always use HTTPS/TLS for anything public-facing.

## Step 4 — Region discipline
Pick **one primary Region** for your workloads and stick to it (e.g., `us-east-1`). Fewer regions = fewer places to secure and monitor. (If you'll use Amazon Bedrock for AI, confirm the models you want are available in that Region.)

## Step 5 — (As you grow) Security Hub
**AWS Security Hub** aggregates findings from GuardDuty, Config, and others into one dashboard and scores you against best-practice standards. Turn it on once you have real workloads running.

---

### ✅ Done when
- GuardDuty is enabled.
- You have a plan to put all secrets in Secrets Manager.
- Encryption is on for storage/databases; HTTPS enforced for public endpoints.
- You've chosen one primary Region.

Next: [`07-startup-credits.md`](07-startup-credits.md)
