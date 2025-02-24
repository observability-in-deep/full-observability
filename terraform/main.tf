resource "helm_release" "prometheus-operator" {
  name       = "prometheus-operator"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"
  version    = "69.4.1"  
  namespace  = "default"
  values = [
    file("${path.module}/values/prometheus/values.yaml")
  ]
  
}

# install otel-operator
resource "helm_release" "otel-operator" {
  name       = "otel-operator"
  repository = "https://open-telemetry.github.io/opentelemetry-helm-charts"
  chart      = "opentelemetry-operator"
  version    = "0.80.2"
  namespace  = "default"
  values = [
    file("${path.module}/values/otel/values.yaml")
  ]

}

# install tempo
resource "helm_release" "tempo" {
  name       = "tempo"
  repository = "https://grafana.github.io/helm-charts"
  chart      = "tempo"
  version    = "1.18.2"
  namespace  = "default"
  values = [
    file("${path.module}/values/tempo/values.yaml")
  ]
}

# install loki
resource "helm_release" "loki" {
  name       = "loki"
  repository = "https://grafana.github.io/helm-charts"
  chart      = "loki-stack"
  namespace  = "default"
  version    = "2.10.2"
}
