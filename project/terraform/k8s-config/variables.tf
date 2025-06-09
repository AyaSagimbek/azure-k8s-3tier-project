variable "namespace" {
  description = "The namespace to deploy into"
  type        = string
  default     = "default"
}

variable "api_chart_path" {
  type        = string
  default     = "../../charts/api"
}

variable "web_chart_path" {
  type        = string
  default     = "../../charts/web"
}

variable "mysql_chart_path" {
  type        = string
  default     = "../../charts/mysql"
}
