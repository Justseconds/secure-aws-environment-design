# 03 — Organizations & Accounts

**Goal:** separate your live product from your experiments using multiple AWS accounts under one umbrella.
**Time:** ~20 minutes.

> **Can I skip this at first?** Yes. If you're a solo founder just prototyping, you can run in your single account for now and come back. But set it up before real customers use your product — it's the biggest "blast radius" protection you get.

## The shape you're building
```
Management account (the one you already made)  ← billing + control only, nothing runs here
        │
        ├── Production account     ← your live product
        └── Development account    ← testing & experiments
```
The management account stays **boring**: no apps, no data, just billing and org management. That keeps your most powerful account your safest account.

## Step 1 — Enable AWS Organizations
1. Sign in (with your new admin login from Step 4, or root if you haven't set that up yet).
2. Go to **AWS Organizations** → **Create an organization**.
3. Choose **All features** (not just consolidated billing) so you can add security guardrails later.

Your current account automatically becomes the **management account**.

## Step 2 — Create member accounts
1. In **Organizations** → **Add an AWS account** → **Create an AWS account**.
2. Create one named e.g. **Production** (use an email like `aws-prod@yourcompany.com`).
3. Repeat to create **Development** (`aws-dev@yourcompany.com`).

> **Email tip:** each AWS account needs a unique email. If your email provider supports `+` aliases, you can use `billing+prod@yourcompany.com`, `billing+dev@yourcompany.com`, etc., all landing in one inbox.

## Step 3 — Organize with OUs (Organizational Units)
OUs are folders for accounts, grouped **by function**, not by department.
1. In **Organizations**, create OUs such as **Workloads** (holds Production + Development) and optionally **Security**.
2. Move the accounts into the matching OU.

## Step 4 — (Later) Add guardrails with SCPs
Service Control Policies (SCPs) are organization-wide rules — e.g., "no one can turn off CloudTrail or GuardDuty." You don't need these on day one, but they're the next maturity step. Note it for later.

---

### ✅ Done when
- AWS Organizations is enabled with **All features**.
- You have separate **Production** and **Development** accounts (or at least one workload account + a plan to add dev).
- The management account runs nothing but billing/org control.

Next: [`04-identity-center-access.md`](04-identity-center-access.md)
