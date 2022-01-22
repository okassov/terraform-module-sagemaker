locals {

    full_name = "${lower(var.environment)}-${lower(var.project)}-${lower(var.name)}"
    
    timestamp = "${timestamp()}"

    base_tags = {
        Managed_By = "terraform"
        Env        = var.environment
        Project    = var.project
        Name       = local.full_name
    }
}
