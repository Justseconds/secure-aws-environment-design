[04-identity-center-access.md](https://github.com/user-attachments/files/29364109/04-identity-center-access.md)
# 04 — Identity Center & Daily Access

**Goal:** create safe, individual logins for you and any teammates — so nobody uses root or shares passwords.
**Time:** ~20 minutes.

This uses **IAM Identity Center** (formerly called AWS SSO), the recommended 2026 way to manage human access across your accounts.

## Step 1 — Enable IAM Identity Center
1. Sign in to the **management account**.
2. Go to **IAM Identity Center** → **Enable**.
3. Pick a home **Region** (this is where the directory lives; your apps can run elsewhere). A common choice is **us-east-1**.

## Step 2 — Create your user
1. In Identity Center → **Users** → **Add user**.
2. Enter your name and email. AWS emails you an invite to set a password and **register MFA** (do register MFA — it can be required).

## Step 3 — Create a permission set
A **permission set** is a bundle of permissions you assign to people for an account.
1. **Permission sets** → **Create permission set**.
2. For your own admin access, start with the predefined **AdministratorAccess** (you can tighten later).
3. For teammates, prefer narrower sets (e.g., **PowerUserAccess** or a custom least-privilege set).

## Step 4 — Assign access to accounts
1. In Identity Center → **AWS accounts**.
2. Select an account (e.g., **Development**), choose **Assign users/groups**, pick your user, and attach the permission set.
3. Repeat for **Production** (give yourself admin there too, but be more careful who else gets it).

## Step 5 — Use the access portal from now on
1. Identity Center shows an **AWS access portal URL** (looks like `https://your-id.awsapps.com/start`). Bookmark it.
2. From now on, **sign in there** instead of as root. You'll see the accounts you can access and pick which to enter.
3. For command-line/programmatic work, use this portal to get **short-lived credentials** (via `aws sso login`) instead of long-term access keys.

## Best practices to keep
- **MFA required** for every person.
- **Least privilege**: give the narrowest permission set that lets someone do their job.
- **Groups**: if you add several people, create groups (e.g., `developers`) and assign permission sets to the group.
- **Offboarding**: when someone leaves, disable their Identity Center user — that instantly cuts all their access.

---

### ✅ Done when
- IAM Identity Center is enabled.
- You have a personal user with MFA and admin access via a permission set.
- You can sign in through the **access portal** and reach your accounts **without using root**.

Next: [`05-logging-and-monitoring.md`](05-logging-and-monitoring.md)
