module "instances" {
  for_each  = var.component
  source    = "git::https://github.com/Rajkumar221/tf-module-app.git"
  component = each.key
  env       = var.env
}