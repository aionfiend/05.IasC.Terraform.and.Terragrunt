resource  "random_pet" "Pet" {
  length = 2
  prefix = "work"
}

resource "local_file" "Pet_name" {
  filename = "~/Documents/DevOps_learning/05.Terraform/05.Iasc.Terraform.and.Terragrunt"
  content  = "Имя моего питомца: ${random_pet.my_pet.id}\n"
}