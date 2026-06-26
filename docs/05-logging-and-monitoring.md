# 05 — Logging & Monitoring

**Goal:** keep a record of everything that happens, and get alerted when something's wrong.
**Time:** ~15 minutes.

## Step 1 — Turn on CloudTrail (the audit log)
CloudTrail records every action taken in your account — who did what, when. If anything ever goes wrong, this is how you find out what happened.

1. Go to **CloudTrail** → **Create trail**.
2. Name it (e.g., `org-audit-trail`).
3. Store logs in a **new S3 bucket** it creates for you.
4. Enable **log file validation** (proves logs weren't tampered with).
5. If you set up AWS Organizations, enable **"Apply trail to my organization"** so it covers all accounts at once.

> Tip: protect the log bucket — don't make it public, and consider locking it so logs can't be deleted.

## Step 2 — Watch your logs with CloudWatch
1. **CloudWatch** is where metrics, dashboards, and alarms live.
2. You already (optionally) set a **billing alarm** in Step 2. You can add alarms later for things like errors in your app's functions.

## Step 3 — Enable AWS Config (optional, recommended as you grow)
**AWS Config** tracks how your resources are configured over time and can flag risky settings (e.g., a storage bucket that became public). Turn it on when you start running real workloads.

## Step 4 — IAM Access Analyzer (optional, recommended)
1. In **IAM** → **Access Analyzer** → create an analyzer.
2. It continuously checks whether any resource is reachable from outside your account/organization, and flags **unused permissions** so you can trim them. Free and very useful.

---

### ✅ Done when
- CloudTrail is on (org-wide if using Organizations), logging to a protected S3 bucket with validation.
- You know where CloudWatch is for future alarms.
- (Optional) Config and Access Analyzer enabled.

Next: [`06-baseline-security-services.md`](06-baseline-security-services.md)
