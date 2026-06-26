# 03 — Organizations & Accounts

**Goal:** separate your live product from your experiments using multiple AWS accounts under one umbrella, so a mistake in one place can't take down another.
**Time:** about 20-30 minutes, going slow.

> **Can I skip this at first?** Yes. If you're a solo founder just prototyping, you can stay in your single account for now and come back. But do it before real customers touch your product, it's the biggest "blast radius" protection you get.

> **Hit a snag?** Almost every common hiccup on this step (greyed-out buttons, "email already exists," can't move an account, can't rename) is covered in [`03.1-things-you-might-run-into.md`](03.1-things-you-might-run-into.md). Keep it open in a tab.

---

## The shape you're building

```
Root  (the top of your whole organization, nothing sits above it)
 │
 ├── Management account   <- the one you already made; billing + control only, nothing runs here
 │
 └── Workloads  (an OU, which is just a folder)
        ├── Production account    <- your live product
        ├── Development account   <- building and testing
        └── Sandbox account       <- optional: a safe place to break and test things
```

Two ideas to hold onto, because they trip people up:

- **Root is the top.** Everything, including your management account, lives *under* Root as a "child." Your management account being a child of Root is correct and normal.
- **Accounts don't go inside other accounts.** The only thing that groups accounts is an **OU (a folder)**. Your management account stays on its own; your workload accounts go into a folder next to it.

Keep the **management account boring**, no apps, no data, just billing and org control. That keeps your most powerful account your safest one.

---

## Step 1 — Turn on AWS Organizations

1. Sign in as your **root user** (or your admin login if you've already done doc 04).
2. In the search bar at the top, type **Organizations** and open **AWS Organizations**.
3. Click **Create an organization**.
4. If asked, choose **All features** (not just "consolidated billing"), so you can add security guardrails later.

**What you'll see:** a green "You successfully created an AWS organization" banner, and your current account now appears under **Root**, tagged **management account**. That's it, Step 1 done. You don't run anything in this account; it just sits at the top doing billing and control.

---

## Step 2 — Create your member accounts

You'll make these one at a time. Start with **Production**.

1. On the AWS accounts screen, click the orange **Add an AWS account** (top right).
2. Choose **Create an AWS account**.
3. Fill in:
   - **Account name:** something clear, like `Production` (or name it per product, e.g. `Resume - Production`, if you'll run more than one business).
   - **Email:** a **unique** address you can actually receive mail at (see the email tip below).
   - **IAM role name:** leave the default (`OrganizationAccountAccessRole`). This is the built-in way your management account gets into the new account to set it up. Don't rename it.
4. Click **Create AWS account**.

**What you'll see:** nothing dramatic. No pop-up, no redirect, the account provisions quietly in the background (usually under a minute). **Refresh the page** and it appears under Root. You'll also get an email at the address you used.

5. Repeat for **Development**, and optionally a **Sandbox** account for safely testing and breaking things.

> **Email tip (this is the #1 snag).** Every AWS account needs a *different* email, and you can't reuse the one your management account uses. Two easy options:
> - **Plus aliases:** `you+prod@yourcompany.org`, `you+dev@yourcompany.org`, `you+sandbox@yourcompany.org`. All land in your one inbox.
> - **Dedicated addresses** (if you own a domain): `aws-prod@yourcompany.org`, `aws-dev@...`. Cleaner and easier to hand off later.

---

## Step 3 — Make a folder (OU) and move the accounts into it

Right now your new accounts are sitting loose directly under Root. Group them into a folder.

**3a. Create the OU (folder) first.** You must do this *before* you can move anything into it.

1. On the Organizations page, **check the box next to Root**. (The Actions menu is greyed out until something is selected, this is why.)
2. Click **Actions -> Create new** (under "Organizational unit").
3. Name it **Workloads** and create it. You'll now see **Workloads** as a folder under Root.

**3b. Move each account into the folder.**

1. **Check the box next to one account** (just one, not Root, not several).
2. Click **Actions -> Move**.
3. In the destination box, pick the **Workloads** OU and confirm.
4. Repeat for each account.

**What you'll see:** when you open the **Workloads** OU, your accounts now appear as its "Children." That means it worked.

> **About renaming:** AWS Organizations has no "Rename account" button on this screen (the greyed-out "Rename" there is for the folder, not the account). Renaming an account happens inside that account's own **Account settings**, and it's far easier after you set up Identity Center (doc 04). Account names are cosmetic anyway, the unique emails and account IDs already tell them apart. Don't let a rename slow you down, and **don't delete accounts to "fix" names** (closing an account locks it in a 90-day suspended state). See 3.1.

---

## Step 4 — (Later) Add guardrails with SCPs

Service Control Policies (SCPs) are organization-wide rules, e.g. "no one can turn off CloudTrail or GuardDuty." You don't need these on day one, but they're the natural next maturity step once your structure is in place. Note it for later.

---

### Done when

- AWS Organizations is on with **All features**.
- You have separate **Production** and **Development** accounts (a **Sandbox** is a nice optional third).
- Those accounts live inside a **Workloads** OU, not loose under Root.
- The management account runs **nothing** but billing and org control.

Next: [`04-identity-center-access.md`](04-identity-center-access.md)
