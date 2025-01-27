## Repository Structure

```plaintext

├── base/                         # Base Kustomize configurations
│   ├── deployment.yaml           # Base deployment spec
│   ├── service.yaml              # Base service spec
│   ├── serviceaccount.yaml       # Base service account spec
│   └── kustomization.yaml        # Base Kustomize file
├── overlays/                     # Environment-specific configurations
│   ├── dev/                      # Dev environment configs
│   │   ├── kustomization.yaml
│   │   ├── patches/
│   │   └── serviceaccount.yaml   # Service account overrides for dev
│   ├── staging/                  # Staging environment configs
│   │   ├── kustomization.yaml
│   │   ├── patches/
│   │   └── serviceaccount.yaml   # Service account overrides for staging
│   └── prod/                     # Production environment configs
│       ├── kustomization.yaml
│       ├── patches/
│       └── serviceaccount.yaml   # Service account overrides for production
└── README.md                     # Project documentation

