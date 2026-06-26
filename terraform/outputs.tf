output "cloudtrail_bucket" {
  description = "Name of the S3 bucket storing CloudTrail logs."
  value       = aws_s3_bucket.trail.id
}

output "cloudtrail_name" {
  description = "Name of the CloudTrail trail."
  value       = aws_cloudtrail.main.name
}

output "guardduty_detector_id" {
  description = "ID of the GuardDuty detector."
  value       = aws_guardduty_detector.main.id
}

output "budget_name" {
  description = "Name of the monthly cost budget."
  value       = aws_budgets_budget.monthly_cost.name
}
