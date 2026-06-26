# 02 — Billing & Budgets

**Goal:** never get a surprise AWS bill. Get an email the moment spending crosses a line you set.
**Time:** ~10 minutes.

## Step 1 — Create a budget with alerts
1. In the Console, go to **Billing and Cost Management** → **Budgets** → **Create budget**.
2. Choose **Use a template (simplified)** → **Monthly cost budget**.
3. Set an amount that would worry you (e.g., **$50** to start — adjust later).
4. Enter the **email** that should be alerted.
5. Create it. AWS will email you when actual or forecasted spend hits **85%** and **100%** of that number (and you can add more thresholds).

> Tip: also add a lower "early warning" budget (e.g., $10) so you notice activity before it grows.

## Step 2 — Turn on a billing alarm (optional but recommended)
A CloudWatch billing alarm is a second safety net.
1. **Billing and Cost Management** → **Billing preferences** → enable **Receive CloudWatch billing alerts** (if not already).
2. Then in **CloudWatch** (region: US East N. Virginia) → **Alarms** → create an alarm on the **EstimatedCharges** metric at a threshold you choose.

## Step 3 — Enable cost visibility tools
1. In **Cost Management**, make sure **Cost Explorer** is enabled (one click). It gives you charts of where money goes.
