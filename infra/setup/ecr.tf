##############################################
# Create ECR repos for storing Docker images #
##############################################

resource "aws_ecr_repository" "app" {
  name                 = "django-framework-app"
  image_tag_mutability = "MUTABLE" # Allows to have image latest version dynamically
  force_delete         = true

  image_scanning_configuration {
    # NOTE: Update to true for real deployments as it scans for latest security vulnerabilities
    scan_on_push = false
  }
}

resource "aws_ecr_repository" "proxy" {
  name                 = "django-framework-proxy"
  image_tag_mutability = "MUTABLE"
  force_delete         = true

  image_scanning_configuration {
    # NOTE: Update to true for real deployments as it scans for latest security vulnerabilities
    scan_on_push = false
  }
}
