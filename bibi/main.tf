module "ha_secured_instances" {
  source = "github.com/infralight/well-architected-env//modules/ha_secured_instances"

  cluster_size  = 3
  instance_name = "bibi"
  instance_type = "SMALL"
}
