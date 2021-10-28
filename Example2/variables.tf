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