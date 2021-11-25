variable "region" {
  description = "What region to create resources in."
  type        = string
  default     = "us-east-1"
}

variable "namespace" {
  description = "namespace, which could be your organiation name, e.g. amazon."
  type        = string
  default     = "myorg"
}

variable "environment" {
  type        = string
  default     = "preprod"
  description = "Environment area, e.g. prod or preprod."
}

variable "delimiter" {
  description = "delimiter, which could be used between name, namespace and env."
  type        = string
  default     = "-"
}

variable "attributes" {
  description = "atttributes, which could be used for additional attributes."
  type        = list(any)
  default     = []
}

variable "account" {
  description = "account, which could be AWS Account Name or Number."
  type        = string
  default     = "myaccount"
}

variable "name" {
  description = "stack name"
  type        = string
  default     = "myproj"
}

variable "tags" {
  description = "tags, which could be used for additional tags."
  type        = map(string)
  default     = {}
}

### SNS Variabls ###
variable "display_name" {
  description = "Display Name for the SNS topic."
  type        = string
  default     = null
}

variable "kms_master_key_id" {
  description = "KMS Key to encrypt SNS topic."
  type        = string
  default     = "aws/sns"
}

variable "access_type" {
  description = "Access type for SNS topic - publish / subscribe / owner."
  type        = string
  default     = "owner"
}

variable "protocol" {
  description = "Protocol type for SNS Subscription."
  type        = string
  default     = null
}

variable "endpoint" {
  description = "Protocol endpoint for SNS Subscription."
  type        = string
  default     = null
}