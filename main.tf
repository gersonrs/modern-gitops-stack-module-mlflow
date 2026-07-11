resource "null_resource" "dependencies" {
  triggers = var.dependency_ids
}

resource "random_password" "oauth2_proxy_cookie_secret" {
  length  = 32
  special = false
}

resource "argocd_project" "this" {
  count = var.argocd_project == null ? 1 : 0

  metadata {
    name      = var.destination_cluster != "in-cluster" ? "mlflow-${var.destination_cluster}" : "mlflow"
    namespace = "argocd"
    annotations = {
      "modern-gitops-stack.io/argocd_namespace" = "argocd"
    }
  }

  spec {
    description  = "MLFlow application project for cluster ${var.destination_cluster}"
    source_repos = ["https://github.com/GersonRS/modern-gitops-stack-module-mlflow.git"]


    destination {
      name      = var.destination_cluster
      namespace = "mlflow"
    }

    orphaned_resources {
      warn = true
    }

    cluster_resource_whitelist {
      group = "*"
      kind  = "*"
    }
  }
}

data "utils_deep_merge_yaml" "values" {
  input = [for i in concat(local.helm_values, local.helm_values_httproute, local.helm_values_oauth2proxy, var.helm_values) : yamlencode(i)]
}

resource "argocd_application" "this" {
  metadata {
    name      = var.destination_cluster != "in-cluster" ? "mlflow-${var.destination_cluster}" : "mlflow"
    namespace = "argocd"
    labels = merge({
      "application" = "mlflow"
      "cluster"     = var.destination_cluster
    }, var.argocd_labels)
  }

  timeouts {
    create = "15m"
    delete = "15m"
  }

  wait = var.app_autosync == { "allow_empty" = tobool(null), "prune" = tobool(null), "self_heal" = tobool(null) } ? false : true

  spec {
    project = var.argocd_project == null ? argocd_project.this[0].metadata.0.name : var.argocd_project

    source {
      repo_url        = "https://github.com/GersonRS/modern-gitops-stack-module-mlflow.git"
      path            = "charts/mlflow"
      target_revision = var.target_revision
      helm {
        values = data.utils_deep_merge_yaml.values.output
      }
    }

    destination {
      name      = var.destination_cluster
      namespace = "mlflow"
    }

    sync_policy {
      dynamic "managed_namespace_metadata" {
        for_each = length(var.namespace_labels) > 0 ? [var.namespace_labels] : []
        content {
          labels = managed_namespace_metadata.value
        }
      }
      dynamic "automated" {
        for_each = toset(var.app_autosync == { "allow_empty" = tobool(null), "prune" = tobool(null), "self_heal" = tobool(null) } ? [] : [var.app_autosync])
        content {
          prune       = automated.value.prune
          self_heal   = automated.value.self_heal
          allow_empty = automated.value.allow_empty
        }
      }

      retry {
        backoff {
          duration     = "20s"
          max_duration = "2m"
          factor       = "2"
        }
        limit = "5"
      }

      sync_options = [
        "CreateNamespace=true"
      ]


    }
  }

  depends_on = [
    resource.null_resource.dependencies,
  ]
}

resource "null_resource" "this" {
  depends_on = [
    resource.argocd_application.this,
  ]
}

data "kubernetes_service_v1" "mlflow" {
  metadata {
    name      = "mlflow"
    namespace = "mlflow"
  }

  depends_on = [
    null_resource.this
  ]
}
