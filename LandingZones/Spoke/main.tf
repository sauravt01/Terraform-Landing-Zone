module "rg" {
  source = "../../Module/rg"
}
module "vnet" {
    depends_on = [ module.rg ]
  source = "../../Module/Vnet"
  
}
module "subnet" {
    depends_on = [ module.vnet ]
  source = "../../Module/subnet"
}

