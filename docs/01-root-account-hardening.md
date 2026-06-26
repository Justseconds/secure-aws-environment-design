# 01 — Root Account Hardening

**Goal:** make your most powerful login nearly impossible to abuse, then stop using it for daily work.
**Time:** ~10 minutes. **Do this first.**

Sign in to the [AWS Console](https://console.aws.amazon.com/) as the **root user** (your account email) one last time to do the steps below.

## Step 1 — Turn on MFA for the root user
MFA (multi-factor authentication) means logging in needs your password **plus** a code from your phone or a security key. This single step blocks the most common attacks.

1. In the top-right, click your account name → **Security credentials**.
2. Find **Multi-factor authentication (MFA)** → **Assign MFA device**.
3. Choose one:
   - **Authenticator app** (e.g., Google Authenticator, Authy, 1Password) — easiest.
   - **Security key** (e.g., YubiKey) — strongest.
4. Follow the prompts to register it. Save backup codes somewhere safe (a password manager).

## Step 2 — Remove root access keys (if any exist)
Access keys are long-term programmatic credentials. The root user should have **none**.

1. Still on **Security credentials**, find **Access keys**.
2. If any exist, **delete** them. (Programmatic access will come from Identity Center later — Step 4.)

## Step 3 — Set a strong, unique root password
1. **Security credentials** → **Password** → change it to a long, unique password stored only in your password manager.

## Step 4 — Secure the account email
Whoever controls the account's email inbox can reset the account. So:
- Use an inbox you fully control (ideally a shared company address, not a personal Gmail).
- Put **MFA on that email account too**.
- Keep the account's **phone number** current under **Account** settings (used for recovery).

## Step 5 — Stop using root
From now on, **only** use the root user for the rare tasks that require it (closing the account, certain billing changes, restoring lost access). Everyday work happens through the admin login you create in Step 4 of this guide.

---

### ✅ Done when
- Root has MFA on.
- Root has zero access keys.
- Root password is long, unique, and in your password manager.
- The account email has its own MFA.

Next: [`02-billing-and-budgets.md`](02-billing-and-budgets.md)
