# terraform-vscode-schema-repro

Reproduces a bug with the Terraform extension for VSCode where a provider schema is not loaded correctly.

## Steps to reproduce

Clone this repository:

```sh
git clone git@github.com:nwalters512/terraform-vscode-schema-repro.git
```

Open the repository in VSCode:

```sh
code terraform-vscode-schema-repro
```

Run `terraform init` in the `terraform/cloudflare` directory:

```sh
cd terraform/cloudflare
terraform init
```

Open `terraform/cloudflare/main.tf` in VSCode.

Hover over the `"cloudflare"` part of `provider "cloudflare" {}` in `main.tf` and observe that the provider is reported as version `5.1.0`.

Run `./random_tree.sh` to generate a random directory structure with 1000 100kB files in `./random_tree`.

Cmd-Shift-P to open the VSCode command palette and type "Developer: Reload Window" and select it.

Hover over the `"cloudflare"` part of `provider "cloudflare" {}` in `main.tf` and observe that the provider is reported as version `4.51.0`.

In addition, observe that the following errors are reported on the `cloudflare_zone.zone` resource:

```
Required attribute "account_id" not specified: An attribute named "account_id" is required hereTerraform
Required attribute "zone" not specified: An attribute named "zone" is required hereTerraform
Unexpected attribute: An attribute named "account" is not expected hereTerraform
```

If you want, remove the `./random_tree` directory to clean up:

```sh
rm -rf ./random_tree
```

At this point, if you reload VSCode again, the correct provider version (`5.1.0`) will be reported and the errors will go away.
