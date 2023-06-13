module "frontend" {
  for_each = var.components
  source = "git::https://github.com/Rajkumar221/tf-module-app.git"
  component = each.key
  env = var.env
}