# Changelog

## [1.5.0](https://github.com/gersonrs/modern-gitops-stack-module-mlflow/compare/v1.4.0...v1.5.0) (2026-07-11)


### 🚀 New Features

* add namespace_labels variable to all modules ([20f1a20](https://github.com/gersonrs/modern-gitops-stack-module-mlflow/commit/20f1a2080c696105d31445c25b87c9cf362ba134))
* add namespace_labels variable to all modules ([1c9722b](https://github.com/gersonrs/modern-gitops-stack-module-mlflow/commit/1c9722b85fc2d672da5c95b10c85289efd7bf73f))

## [1.4.0](https://github.com/gersonrs/modern-gitops-stack-module-mlflow/compare/v1.3.0...v1.4.0) (2026-05-19)


### 🚀 New Features

* add --skip-jwt-bearer-tokens for programmatic MLflow access ([c2c3fb2](https://github.com/gersonrs/modern-gitops-stack-module-mlflow/commit/c2c3fb290ca0d9f6ace2c81e6c5de9a053cafe4d))
* add allowed_groups variable for RBAC via oauth2-proxy ([16efa29](https://github.com/gersonrs/modern-gitops-stack-module-mlflow/commit/16efa292495c8ea69feffc6fd30417f0c7a8ac83))
* add oauth2-proxy for Keycloak SSO authentication ([7fb8d73](https://github.com/gersonrs/modern-gitops-stack-module-mlflow/commit/7fb8d735bc70b2f96906846d19e5eb21f9f9060f))
* migrate from Traefik Ingress to Istio Gateway API HTTPRoute ([7068082](https://github.com/gersonrs/modern-gitops-stack-module-mlflow/commit/7068082d14f275958edc010c71e391f332274df6))
* migrate to Istio HTTPRoute, add oauth2-proxy RBAC and SSO ([93185c9](https://github.com/gersonrs/modern-gitops-stack-module-mlflow/commit/93185c9070225500489485b6a5db439ce708b045))


### 🔥 Bug Fixes

* add groups scope to oauth2-proxy for Keycloak group claims ([fef7872](https://github.com/gersonrs/modern-gitops-stack-module-mlflow/commit/fef7872dddebf1d44e197f20783bf8a5f0ad7cec))
* escape quotes in allowed_groups description ([ce4b586](https://github.com/gersonrs/modern-gitops-stack-module-mlflow/commit/ce4b5869165cafd11264bc2eee789ff810011ea0))
* move httproute values to wrapper chart root to avoid schema validation ([5d358c0](https://github.com/gersonrs/modern-gitops-stack-module-mlflow/commit/5d358c0fae33017c8db55f2a43c3661b8a7c1a83))

## [1.3.0](https://github.com/GersonRS/modern-gitops-stack-module-mlflow/compare/v1.2.1...v1.3.0) (2026-01-26)


### 🚀 New Features

* adjust kubernetes revision ([f8131a6](https://github.com/GersonRS/modern-gitops-stack-module-mlflow/commit/f8131a6867d3fbf8daf1325392c28675a98f13cf))
* adjust workflows ([d864d0f](https://github.com/GersonRS/modern-gitops-stack-module-mlflow/commit/d864d0f5ae090b96ce3744f8f10adce0d291e5ef))
* update chart ([4e7b5ba](https://github.com/GersonRS/modern-gitops-stack-module-mlflow/commit/4e7b5baf092bfc0a4083865bd1f7895485bbc50c))
* update the things ([ff31ffc](https://github.com/GersonRS/modern-gitops-stack-module-mlflow/commit/ff31ffc34f5bf5e415df27077605890d7b4fb0d5))


### 🔥 Bug Fixes

* adicionar allowedHosts para proteção DNS rebinding do MLflow 2.x ([e7f7156](https://github.com/GersonRS/modern-gitops-stack-module-mlflow/commit/e7f715633e5949511bdcbb66c751c3ae5d8cea41))
* desabilitar log para usar uvicorn com allowedHosts ([cd5fcf0](https://github.com/GersonRS/modern-gitops-stack-module-mlflow/commit/cd5fcf01102f13fc510479a516c8f330f0fddee5))
* usar disableSecurityMiddleware em vez de allowedHosts para compatibilidade com gunicorn ([edfd5e9](https://github.com/GersonRS/modern-gitops-stack-module-mlflow/commit/edfd5e9c2fdc8d093319849f18404550abef1643))


### ⚙️ Chores

* remover arquivos extraídos do chart mlflow ([2ae9c33](https://github.com/GersonRS/modern-gitops-stack-module-mlflow/commit/2ae9c33362aec1a2e8350630a1f96843b9b9afb5))

## [1.2.1](https://github.com/GersonRS/modern-gitops-stack-module-mlflow/compare/v1.2.0...v1.2.1) (2025-02-08)


### ⌨️ Code Refactoring

* adjust workflows ([c9ba0ab](https://github.com/GersonRS/modern-gitops-stack-module-mlflow/commit/c9ba0ab7f249da0c7cea7e8b96acb8015c42500d))
* try adjust code 5 ([b453802](https://github.com/GersonRS/modern-gitops-stack-module-mlflow/commit/b45380227976798a752e2161c50db70a80507978))

## [1.2.0](https://github.com/GersonRS/modern-gitops-stack-module-mlflow/compare/v1.1.1...v1.2.0) (2025-01-18)


### 🚀 New Features

* update provider and chart ([f30954c](https://github.com/GersonRS/modern-gitops-stack-module-mlflow/commit/f30954ce4c7c9b59b0deac718849699db03c5cc1))

## [1.1.1](https://github.com/GersonRS/modern-gitops-stack-module-mlflow/compare/v1.1.0...v1.1.1) (2024-08-08)


### 🔥 Bug Fixes

* fix source repo ([1f3f036](https://github.com/GersonRS/modern-gitops-stack-module-mlflow/commit/1f3f0365f01e7a7d2ea69f465f85f7daa452e402))

## [1.1.0](https://github.com/GersonRS/modern-gitops-stack-module-mlflow/compare/v1.0.0...v1.1.0) (2024-05-17)


### 🚀 New Features

* ajdust module ([1d8d788](https://github.com/GersonRS/modern-gitops-stack-module-mlflow/commit/1d8d788adc9c456c95eed7bb7ba52a44671a9d49))

## [2.4.0](https://github.com/GersonRS/modern-gitops-stack-module-minio/compare/v2.3.0...v2.4.0) (2024-05-01)


### 🚀 New Features

* add pre-commit, config release-please workflow and adjust add-to-project workflow ([1297a4d](https://github.com/GersonRS/modern-gitops-stack-module-minio/commit/1297a4d3c500c07a0975f4f9b31b2ee5846ce1d1))
* finish configuration ([42d3c3b](https://github.com/GersonRS/modern-gitops-stack-module-minio/commit/42d3c3bb399e003ce95513457b9ceae1be269719))
* include page in documentation ([d6d495d](https://github.com/GersonRS/modern-gitops-stack-module-minio/commit/d6d495d8d0ca4fbd587aa0acd2fe8955850a0d94))
* module modularization ([f0f6f48](https://github.com/GersonRS/modern-gitops-stack-module-minio/commit/f0f6f48b11ab448280f1c809e4ddfbb781a4a495))
* module modularization ([93ddc18](https://github.com/GersonRS/modern-gitops-stack-module-minio/commit/93ddc1805cc5cb6eabf8e18c6602d3e73a5543ee))
* Update minio config and change mode to distributed mode ([cca6ff1](https://github.com/GersonRS/modern-gitops-stack-module-minio/commit/cca6ff1eed86264a89d44fd8fa314af6d8e6a87e))


### 🔥 Bug Fixes

* adjust module target revision ([2479aea](https://github.com/GersonRS/modern-gitops-stack-module-minio/commit/2479aea5459a3a09002061efb8c37b4084c5dc14))


### 📚 Documentation

* **pull_request:** update pull request template ([72f8b15](https://github.com/GersonRS/modern-gitops-stack-module-minio/commit/72f8b1535bf1c7e2f3f081debf90cea34b3fc5ef))
* **terraform-docs:** generate docs and write to README.adoc ([9477c8e](https://github.com/GersonRS/modern-gitops-stack-module-minio/commit/9477c8ea11903f69fda72ec51b3cc13db703b93d))
* **terraform-docs:** generate docs and write to README.adoc ([d7e9806](https://github.com/GersonRS/modern-gitops-stack-module-minio/commit/d7e9806c63124b66dd3d25fa5259a997cc280860))


### ⚙️ Chores

* release 1.0.0 ([1aa4277](https://github.com/GersonRS/modern-gitops-stack-module-minio/commit/1aa4277287af68ac86105686a6bb12ce1feaad2e))
* release 1.1.0 ([bba3ae9](https://github.com/GersonRS/modern-gitops-stack-module-minio/commit/bba3ae9232b9f0c5e5dc818b12333b5e0b1f094d))
* release 1.2.0 ([4e2f211](https://github.com/GersonRS/modern-gitops-stack-module-minio/commit/4e2f2114331fd6b1aceecc449092a65bb91b7f44))

## [1.2.0](https://github.com/GersonRS/modern-gitops-stack-module-minio/compare/v1.1.0...v1.2.0) (2024-04-28)


### Features

* Update minio config and change mode to distributed mode ([cca6ff1](https://github.com/GersonRS/modern-gitops-stack-module-minio/commit/cca6ff1eed86264a89d44fd8fa314af6d8e6a87e))

## [1.1.0](https://github.com/GersonRS/modern-gitops-stack-module-minio/compare/v1.0.0...v1.1.0) (2024-04-26)


### Features

* include page in documentation ([d6d495d](https://github.com/GersonRS/modern-gitops-stack-module-minio/commit/d6d495d8d0ca4fbd587aa0acd2fe8955850a0d94))


### Bug Fixes

* adjust module target revision ([2479aea](https://github.com/GersonRS/modern-gitops-stack-module-minio/commit/2479aea5459a3a09002061efb8c37b4084c5dc14))

## 1.0.0 (2024-04-24)


### Features

* finish configuration ([42d3c3b](https://github.com/GersonRS/modern-gitops-stack-module-minio/commit/42d3c3bb399e003ce95513457b9ceae1be269719))
* module modularization ([f0f6f48](https://github.com/GersonRS/modern-gitops-stack-module-minio/commit/f0f6f48b11ab448280f1c809e4ddfbb781a4a495))
* module modularization ([93ddc18](https://github.com/GersonRS/modern-gitops-stack-module-minio/commit/93ddc1805cc5cb6eabf8e18c6602d3e73a5543ee))
