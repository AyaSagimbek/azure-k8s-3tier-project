output "api_release_name" {
  value = helm_release.api.name
}

output "web_release_name" {
  value = helm_release.web.name
}

output "mysql_release_name" {
  value = helm_release.mysql.name
}