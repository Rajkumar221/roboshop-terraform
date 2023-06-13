module "instances" {
  for_each  = var.components
  source    = "git::https://github.com/Rajkumar221/tf-module-app.git"
  components = each.key
  env       = var.env
}