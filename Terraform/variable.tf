
## Alert email endpoint
variable "alert_email_id" {
  description = "Email id to send alerts to "
  type        = string
  default     = "dconesoko@gmail.com"
}

variable "project_id"{
  description = "The ID of the project in which resources will be provisioned."
  type        = string
  default     = "silver-rain-325220"
}

variable "region" {
  description = "The region in which resources will be provisioned."
  type        = string
  default     = "us-central1"
}

variable "credentials"{
  description = "The Google Cloud credentials."
  type        = string
  default     = "../service_key.json"
}