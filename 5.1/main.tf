resource "random_pet" "Pet" {
  length    = 2
  separator = "-"
  prefix    = "work"
}

resource "local_file" "Pet_name" {
  filename = "${path.module}/petsname.txt"
  content  = "Имя моего питомца: ${random_pet.Pet.id}\n"
}