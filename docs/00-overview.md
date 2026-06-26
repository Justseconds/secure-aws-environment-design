# 00 — Overview & Principles

Before clicking anything, here's the mental model. Five ideas explain almost every step in this guide.

## 1. The root user is precious — protect it, don't use it
When you created your AWS account, you got a **root user** (your email + password). It can do *everything*, including closing the account and changing billing. Because it's so powerful, you protect it heavily and then **stop using it** for daily work. You create a separate, less-powerful login for everyday tasks.

## 2. Humans should log in through IAM Identity Center, not shared passwords
Modern AWS practice (2026) is: don't create old-style "IAM users" with permanent passwords for people. Instead use **IAM Identity Center**, which gives each person their own secure sign-in with short-lived credentials and MFA. Easier to manage, easier to switch people on/off, far safer.

## 3. Separate accounts = separate locked rooms
As you grow, you keep **development** and **production** in *separate AWS accounts* under one umbrella (**AWS Organizations**). If something breaks in dev, it can't touch your live product or your audit trail. One locked room is safer than one giant warehouse. The top "management" account stays boring — billing only, nothing runs there.

## 4. Least privilege
Every person and every piece of software gets **only the permissions it needs** — nothing more. If a login is ever stolen, this limits how much damage is possible.

## 5. Turn on the cameras
**CloudTrail** records every action (the audit log). **GuardDuty** watches for threats automatically. **Budgets** watch your spending. You turn these on early so you always know what's happening and get alerted when something's off.

---

## How big should this be for a small company?

Keep it simple at first. A very reasonable starting shape:

- **1 management account** (the one you already made) — billing and org control only.
- **1 production account** — your live product runs here.
- **1 development account** — for testing and experiments.

You can even start with just **management + one workload account** and add the dev account later. The structure scales when you need it.

---

## A note on cost
Almost everything in this foundation is **free or nearly free** at small-company scale:
- Root hardening, Identity Center, Organizations, Budgets: free.
- CloudTrail: one free trail per account.
- GuardDuty: free 30-day trial, then a small usage-based cost.
You set up a budget alert in Step 2 precisely so nothing surprises you.

Next: [`01-root-account-hardening.md`](01-root-account-hardening.md)
