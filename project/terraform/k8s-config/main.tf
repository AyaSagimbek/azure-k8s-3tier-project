provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

# Deploy MySQL
resource "helm_release" "mysql" {
  name       = "mysql"
  chart      = "${path.module}/../../charts/mysql"
  namespace  = "default"

  values = [
    file("${path.module}/../../charts/mysql/values.yaml")
  ]
}

# Deploy API
resource "helm_release" "api" {
  name       = "api"
  chart      = "${path.module}/../../charts/api"
  namespace  = "default"

  values = [
    file("${path.module}/../../charts/api/values.yaml")
  ]
}

# Deploy Web
resource "helm_release" "web" {
  name       = "web"
  chart      = "${path.module}/../../charts/web"
  namespace  = "default"

  values = [
    file("${path.module}/../../charts/web/values.yaml")
  ]
}
