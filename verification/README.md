# Verification — proving the foundation is really set up

This folder is how you show the playbook was actually done, **without leaking anything sensitive**.

## ⚠️ The one rule that matters

**Never put raw AWS account data in a public repo.** Screenshots and exports often contain:
- your **12-digit account ID**
- **ARNs** (which embed the account ID)
- **email addresses**, **bucket names**, **IP addresses**

These are reconnaissance gold for attackers. So:

- **Raw evidence** (full screenshots, unredacted exports) → keep **private** (e.g., a separate private repo, or just on your machine). The `evidence/` folder here is **gitignored** so raw captures never get committed by accident.
- **Public proof** → only the **sanitized** versions, after you've reviewed them by eye.

## The three kinds of proof (weakest → strongest)

1. **Completion log** — `completion-log.md`. A dated attestation you fill in and sign. Contains no sensitive data, so it's safe to publish as-is. Good baseline proof.
2. **Sanitized CLI exports** — run `gather-proof.sh` (below). It captures real, read-only output from your account (e.g. `AccountMFAEnabled: 1`) and redacts account IDs and emails. Strong, verifiable, and safe once you've eyeballed it.
3. **AWS Security Hub score** — the strongest. AWS grades your account against best-practice standards. A screenshot of your security score (with IDs blurred) proves the setup genuinely meets the bar, not just that buttons were clicked. Enable Security Hub, let it run, screenshot the score, blur identifiers, save it.

## How to use this folder

```bash
cd verification
chmod +x gather-proof.sh
./gather-proof.sh          # writes redacted .txt files into ./evidence/ (gitignored)
```

Then:
1. Open every file in `evidence/` and **confirm it's clean** (the script's redaction is best-effort, not a guarantee).
2. Fill in `completion-log.md` with real dates as you finish each step.
3. To publish proof: copy a *reviewed, sanitized* file out of `evidence/` into a `published/` folder you create, and commit only that. Or just publish the completion log.

## Capturing screenshots safely

If you screenshot the console:
- Crop or blur the **account ID** (top-right menu), any **ARNs**, **emails**, and **bucket names**.
- A quick way: open the image, draw solid boxes over those fields before saving.
- Keep the original (unblurred) private; only share the blurred copy.

---

*Honest proof means capturing what you actually did. Fill the log in as you go, not after the fact.*
