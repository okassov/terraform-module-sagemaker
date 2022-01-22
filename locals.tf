locals {

    full_name = "${lower(var.environment)}-${lower(var.project)}-${lower(var.name)}"
    
    timestamp = "${timestamp()}"
    timestamp_sanitized = "${replace("${local.timestamp}", "/[- TZ:]/", "")}"

    base_tags = {
        Managed_By = "terraform"
        Env        = var.environment
        Project    = var.project
        Name       = local.full_name
    }
}
