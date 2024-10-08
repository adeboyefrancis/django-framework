variable "tf_state_bucket" {
  description = "Name of S3 bucket in AWS for storing TF state"
  default     = "infra-blueprint-tfstate"
}


variable "tf_state_lock_table" {
  description = "Name of DynamoDB table for TF state locking"
  default     = "infra-state-lock"
}


variable "project" {
  description = "Project name for tagging resources"
  default     = "django-framework"
}


variable "contact" {
  description = "Contact name for tagging resources"
  default     = "adeboye.francis@icloud.com"
}
