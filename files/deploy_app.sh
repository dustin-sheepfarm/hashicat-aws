#!/bin/bash
# Script to deploy a very simple web application.
# The web app has a customizable image and some text.

cat << EOM > /var/www/html/index.html
<html>
  <head><title>Meow!</title></head>
  <body>
  <div style="width:800px;margin: 0 auto">

  <!-- BEGIN -->
  <center><img src="http://${PLACEHOLDER}/${WIDTH}/${HEIGHT}"></img></center>
  <center><h2>Meow World!</h2></center>
  Welcome to ${PREFIX}'s app. HashiCorp Terraform is an Infrastructure as Code (IaC) tool that allows you to define, provision, and manage cloud resources using a declarative language called HCL (HashiCorp Configuration Language). Terraform stores its state, which is a snapshot of the current infrastructure managed by Terraform, in a local file by default, called terraform.tfstate. However, this approach can be problematic when working in a team or using automated systems, as the state file must be kept in sync and protected from accidental deletions or modifications.

To address these issues, Terraform supports remote backends, which provide a centralized way to store, manage, and collaborate on Terraform state files. Remote backends enable better collaboration, versioning, and state locking, among other features.

Here's a brief explanation of Terraform remote backends:

Storage: Remote backends store the Terraform state file remotely, preventing issues with local state files, such as conflicts or accidental deletions.
Locking: Some remote backends provide state locking, which prevents concurrent runs of Terraform that could result in conflicting changes to the infrastructure.
Collaboration: Remote backends enable better collaboration among team members, as the state file is stored centrally, and everyone can work on the same infrastructure with up-to-date information.
Versioning: Some remote backends support versioning of the state files, which can be useful for auditing changes and rolling back to a previous state if necessary.
Private Terraform Registry: Some remote backends, like Terraform Cloud and Terraform Enterprise, can also serve as a private module registry, allowing you to share and reuse modules within your organization.
To configure a remote backend, you need to add a backend block to your Terraform configuration file (main.tf or backend.tf). Here's an example using the S3 backend:

hcl

terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "YOURORGANIZATION"
    workspaces {
      name = "YOURWORKSPACE"
    }
  }
}

This example configures the S3 backend for storing the Terraform state file in an S3 bucket named "my-terraform-state" in the us-west-2 region. The key attribute specifies the path to the state file within the bucket, and encrypt is set to true to enable server-side encryption. The dynamodb_table attribute is used to specify a DynamoDB table for state locking.

Remember to run terraform init after configuring the remote backend, as this command initializes the backend and downloads the required provider plugins.
  <!-- END -->

  </div>
  </body>
</html>
EOM

echo "Script complete."
