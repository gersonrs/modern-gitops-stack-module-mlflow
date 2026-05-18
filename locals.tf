locals {
  domain = "mlflow.${var.subdomain != "" ? "${trimprefix(var.subdomain, ".")}." : ""}${var.base_domain}" # https://mlflow.apps.172-19-0-100.nip.io/

  helm_values = [{
    mlflow = {
      serviceMonitor = {
        enabled = var.enable_service_monitor
      }
      # Disable log to prevent gunicorn-opts being added (required for security middleware)
      log = {
        enabled = false
      }
      extraEnvVars = {
        MLFLOW_S3_ENDPOINT_URL = "http://${var.storage.endpoint}"
        MLFLOW_S3_IGNORE_TLS   = true
        # MLFLOW_S3_UPLOAD_EXTRA_ARGS: '{"ServerSideEncryption": "aws:kms", "SSEKMSKeyId": "1234"}'
        # AWS_DEFAULT_REGION: my_region
      }
      # Allowed hosts for DNS rebinding protection (MLflow 2.x+ with uvicorn)
      extraArgs = {
        allowedHosts = local.domain
      }

      artifactRoot = {
        s3 = {
          enabled            = true
          bucket             = "mlflow"
          path               = ""
          awsAccessKeyId     = var.storage.access_key
          awsSecretAccessKey = var.storage.secret_access_key
        }
      }
      backendStore = {
        databaseConnectionCheck = true
        databaseMigration : true
        postgres = {
          enabled  = true
          host     = var.database.service
          port     = 5432
          database = var.database.database
          user     = var.database.user
          password = var.database.password
        }
      }
      ingress = {
        # -- Specifies if you want to create an ingress access
        enabled : false
      }
    }
  }]

  helm_values_httproute = [{
    httproute = {
      enabled           = true
      host              = local.domain
      gateway_name      = var.gateway_name
      gateway_namespace = var.gateway_namespace
      # When oidc is configured, HTTPRoute points to oauth2-proxy instead of mlflow directly
      backend_service = var.oidc != null ? "mlflow-oauth2-proxy" : "mlflow"
      backend_port    = var.oidc != null ? 4180 : 80
    }
  }]

  helm_values_oauth2proxy = var.oidc != null ? [{
    oauth2proxy = {
      enabled      = true
      upstreamUrl  = "http://mlflow:80"
      redirectUrl  = "https://${local.domain}/oauth2/callback"
      cookieSecret = random_password.oauth2_proxy_cookie_secret.result
      oidc = {
        issuerUrl    = var.oidc.issuer_url
        clientId     = var.oidc.client_id
        clientSecret = var.oidc.client_secret
      }
      extraArgs = var.oidc.oauth2_proxy_extra_args
    }
  }] : []
}
