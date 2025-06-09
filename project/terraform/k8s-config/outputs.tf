output "web_chart_status" {
  value = helm_release.web.status
}

output "api_chart_status" {
  value = helm_release.api.status
}

output "mysql_chart_status" {
  value = helm_release.mysql.status
}