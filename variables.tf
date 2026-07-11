#######################
## Standard variables
#######################

variable "cluster_name" {
  description = "Name given to the cluster. Value used for naming some the resources created by the module."
  type        = string
}

variable "base_domain" {
  description = "Base domain of the cluster. Value used for the ingress' URL of the application."
  type        = string
}

variable "subdomain" {
  description = "Subdomain of the cluster. Value used for the ingress' URL of the application."
  type        = string
  default     = "apps"
  nullable    = false
}

variable "argocd_project" {
  description = "Name of the Argo CD AppProject where the Application should be created. If not set, the Application will be created in a new AppProject only for this Application."
  type        = string
  default     = null
}

variable "argocd_labels" {
  description = "Labels to attach to the Argo CD Application resource."
  type        = map(string)
  default     = {}
}

variable "destination_cluster" {
  description = "Destination cluster where the application should be deployed."
  type        = string
  default     = "in-cluster"
}

variable "target_revision" {
  description = "Override of target revision of the application chart."
  type        = string
  default     = "v1.1.1" # x-release-please-version
}

variable "cluster_issuer" {
  description = "SSL certificate issuer to use. Usually you would configure this value as `letsencrypt-staging` or `letsencrypt-prod` on your root `*.tf` files."
  type        = string
  default     = "selfsigned-issuer"
}

variable "enable_service_monitor" {
  description = "Enable Prometheus ServiceMonitor in the Helm chart."
  type        = bool
  default     = true
}

variable "helm_values" {
  description = "Helm chart value overrides. They should be passed as a list of HCL structures."
  type        = any
  default     = []
}

variable "app_autosync" {
  description = "Automated sync options for the Argo CD Application resource."
  type = object({
    allow_empty = optional(bool)
    prune       = optional(bool)
    self_heal   = optional(bool)
  })
  default = {
    allow_empty = false
    prune       = true
    self_heal   = true
  }
}

variable "dependency_ids" {
  description = "IDs of the other modules on which this module depends on."
  type        = map(string)
  default     = {}
}

variable "namespace_labels" {
  description = "Labels to apply to the destination namespace managed by Argo CD (requires CreateNamespace=true)."
  type        = map(string)
  default = {
    "istio.io/dataplane-mode" = "ambient"
  }
}

#######################
## Module variables
#######################

variable "storage" {
  description = "MinIO S3 bucket configuration values for the bucket where the archived metrics will be stored."
  type = object({
    bucket_name       = string
    endpoint          = string
    access_key        = string
    secret_access_key = string
  })
}

variable "database" {
  description = "database configuration"
  type = object({
    user     = string
    password = string
    database = string
    service  = string
  })
}

variable "gateway_name" {
  description = "Name of the Istio Gateway resource to attach HTTPRoutes to."
  type        = string
  default     = "istio-gateway"
}

variable "gateway_namespace" {
  description = "Namespace where the Istio Gateway resource is deployed."
  type        = string
  default     = "istio-ingress"
}

variable "oidc" {
  description = "OIDC configuration for oauth2-proxy authentication in front of MLflow. When set, all requests are authenticated via the configured OIDC provider (e.g. Keycloak) before reaching MLflow."
  type = object({
    issuer_url              = string
    oauth_url               = string
    token_url               = string
    api_url                 = string
    client_id               = string
    client_secret           = string
    oauth2_proxy_extra_args = optional(list(string), [])
  })
  default = null
}

variable "allowed_groups" {
  description = "List of Keycloak groups allowed to access MLflow (e.g. [\"/data-scientists\"]). When empty, any authenticated user is allowed. Only effective when oidc is configured."
  type        = list(string)
  default     = []
}
