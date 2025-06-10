variable "namespace" {
  description = "The namespace to deploy into"
  type        = string
  default     = "default"
}

variable "mysql_values_path" {
  type    = string
  default = "./helm-charts/mysql/values.yaml"
}

variable "api_values_path" {
  type    = string
  default = "./helm-charts/api/values.yaml"
}

variable "web_values_path" {
  type    = string
  default = "./helm-charts/web/values.yaml"
}

variable "mysql_chart_dir" {
  type    = string
  default = "./helm-charts/mysql"
}

variable "api_chart_dir" {
  type    = string
  default = "./helm-charts/api"
}

variable "web_chart_dir" {
  type    = string
  default = "./helm-charts/web"
}