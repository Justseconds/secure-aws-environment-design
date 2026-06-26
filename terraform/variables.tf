variable "aws_region" {
  description = "Primary AWS region to deploy into."
  type        = string
  default     = "us-east-1"
}

variable "alert_email" {
  description = "Email address that receives budget alerts."
  type        = string
}

variable "budget_amount" {
  description = "Monthly budget amount in USD (string, e.g. \"50\")."
  type        = string
  default     = "50"
}

variable "name_prefix" {
  description = "Prefix for resource names so they're easy to identify."
  type        = string
  default     = "company-foundation"
}
