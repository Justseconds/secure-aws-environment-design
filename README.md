# Small Business AWS Playbook

A playbook for setting up AWS **securely** for a small business. A step-by-step, follow-in-order guide written to be done click by click by someone who is not an AWS expert.

This is the foundation you set up **once**, before you build any product on top of it.

> You do **not** need to do everything here on day one. Follow the **Quick Start** to get safe fast, then work through the rest as you grow.

---

## Quick Start (the 4 things to do first)

Do these four before anything else. Together they take about 30–45 minutes and remove the biggest risks.

1. **Lock down the root user** → [`docs/01-root-account-hardening.md`](docs/01-root-account-hardening.md)
   Turn on MFA, remove root access keys, stop using root for daily work.
2. **Set a billing budget + alert** → [`docs/02-billing-and-budgets.md`](docs/02-billing-and-budgets.md)
   So a runaway cost emails you early instead of surprising you on the bill.
3. **Create a daily-use admin login (not root)** → [`docs/04-identity-center-access.md`](docs/04-identity-center-access.md)
   Use IAM Identity Center so you (and any teammates) sign in safely.
4. **Turn on the audit log (CloudTrail)** → [`docs/05-logging-and-monitoring.md`](docs/05-logging-and-monitoring.md)
   A record of every action taken in your account.

When those four are done, you have a "safe to keep building on" account.

---

## Full setup order

| # | Step | Why it matters | Time |
|---|------|----------------|------|
| 0 | [Overview & principles](docs/00-overview.md) | Understand the model before clicking | 5 min |
| 1 | [Root account hardening](docs/01-root-account-hardening.md) | The #1 thing attackers target | 10 min |
| 2 | [Billing & budgets](docs/02-billing-and-budgets.md) | Never get a surprise bill | 10 min |
| 3 | [Organizations & accounts](docs/03-organizations-and-accounts.md) | Separate dev from production | 20 min |
| 4 | [Identity Center & access](docs/04-identity-center-access.md) | Safe daily logins, no shared passwords | 20 min |
| 5 | [Logging & monitoring](docs/05-logging-and-monitoring.md) | Know what happened, get alerted | 15 min |
| 6 | [Baseline security services](docs/06-baseline-security-services.md) | Automated threat detection | 15 min |
| 7 | [Startup credits](docs/07-startup-credits.md) | Get up to $100k in AWS credits | 15 min |

Print or work from [`checklists/setup-checklist.md`](checklists/setup-checklist.md) as you go.

---

## Optional: automate it with Terraform

The [`terraform/`](terraform/) folder contains an **optional** starter that creates the budget, audit log, and threat detection automatically instead of clicking. Skip it if you're new — the docs cover the manual way. See [`terraform/README.md`](terraform/README.md).

---

## What this repo is NOT

- Not legal, tax, or compliance advice. For a real company, get a professional review before launch, especially for anything handling customer personal data.
- Not exhaustive enterprise security. It's a solid small-company foundation you extend as you grow.

---

*Last reviewed against AWS guidance: June 2026. AWS console wording changes occasionally; if a button name differs slightly, search the service name in the AWS Console.*
