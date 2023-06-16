module "webserverModuleaxel" {
  source = "../test-terra-nginx"
  location = "francecentral"
  instance_size = "Standard_B2s"
  environment = "Staging"
}
