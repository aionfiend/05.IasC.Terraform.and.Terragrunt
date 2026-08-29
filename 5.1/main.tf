resource  "random_pet " "pet_test" {
  length = 2
  prefix = "work"
}

resource "local_file" "pet_name" {
  filename = "~/Documents/DevOps_learning/05.Terraform/05.Iasc.Terraform.and.Terragrunt"
}