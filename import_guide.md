- Add import block in main.tf
```
import {
  to = module.vulnerable_resources.google_compute_firewall.nam1
  id = "projects/380343084411/global/firewalls/default-allow-ssh"
}
```
- Run import command
```
terraform plan -generate-config-out=generated.tf
```
- This will generate the config in generated.tf file and then copy it in folder imported_resources/resources.tf, eg contents
```
resource "google_compute_firewall" "nam1" {
  description             = "Allow SSH from anywhere"
  destination_ranges      = []
  direction               = "INGRESS"
  disabled                = false
  name                    = "default-allow-ssh"
  network                 = "https://www.googleapis.com/compute/v1/projects/cpt-poc-1/global/networks/default"
  priority                = 65534
  project                 = "380343084411"
  source_ranges           = ["0.0.0.0/0"]
  source_tags             = []
  allow {
    ports    = ["22"]
    protocol = "tcp"
  }
}
```
- Now delete the generated.tf file in the root dir
- Run `terraform plan` command and check that resource needs to imported in plan
- Run `terraform apply` to do the import
- Remove the import block finally from the main.tf file
- Can check the tfstate using `terrafrom show --json`