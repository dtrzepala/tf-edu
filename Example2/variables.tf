variable "location" {
  description = "Location"
  default     = "West Europe"
}
variable "tags" {
  description = "Tags to apply to resources created"
  type        = map(string)
  default = {
    Terraform   = "true"
    Environment = "test"
  }
}
variable "subscription_id" {
  description = "Subscription to be used"
}

variable "ip_rules" {
  description = "whitelist"
  default = [
    "51.154.170.223",
    "194.230.147.163",
    "109.95.201.142",
    "188.123.210.197",
    "188.123.210.198",
    "188.123.210.199",
  ]
}