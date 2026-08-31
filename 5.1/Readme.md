# 5.1
1)tofu init - проводит инийиализацию кода: создает системные файлы, скачивает указанные провайдеры.
2)tofu fmt - форматирует код, привод к стандарному виду.
3)tofu validate - проверка текста на опечатки/ошибки в  тексте.
4)tofu plan - создает первичный план по разворочиванию ресурсов из кода, или сверяет м указывает разницу между существующим кодом и развернутой инфроструктурой.
5)tofu apply - запускает процес развертывания кода в соответствии с планом и вносит изменения в файл state.

terraform.tfstate - сожержит множество секретной и/или персональной информации, позволяющей поливлиять/украсть данные из развернутой инфроструктуры или внедрить
в нее вдругой вредоносный код.

# 5.2

user@users-MacBook-Pro$ tofu plan
random_pet.Pet: Refreshing state... [id=work_possibly_real_minnow]
local_file.Pet_name: Refreshing state... [id=3976f7791ad8afa1da3f59319df2b8a343e14a3d]

OpenTofu used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
-/+ destroy and then create replacement

OpenTofu will perform the following actions:

***local_file.Pet_name must be replaced
-/+ resource "local_file" "Pet_name" {
~ content              = <<-EOT # forces replacement
Имя моего питомца: work_possibly_real_minnow
EOT -> (known after apply) # forces replacement
~ content_base64sha256 = "X3zwy6NMLJiGxZbtozqzBbR+F1CD1D3SLkOc/C1ooj0=" -> (known after apply)
~ content_base64sha512 = "UEr4zCeydwCeVhNxU/nuyW4GUrA6LyC9m4zdxnZyNCgKdHc+5hvi2pRgCUagboUsa651YKGVSjLrrNlOr/QoPw==" -> (known after apply)
~ content_md5          = "5b7c106a1b0fd6554bc834e14dfbdb8b" -> (known after apply)
~ content_sha1         = "3976f7791ad8afa1da3f59319df2b8a343e14a3d" -> (known after apply)
~ content_sha256       = "5f7cf0cba34c2c9886c596eda33ab305b47e175083d43dd22e439cfc2d68a23d" -> (known after apply)
~ content_sha512       = "504af8cc27b277009e56137153f9eec96e0652b03a2f20bd9b8cddc6767234280a74773ee61be2da94600946a06e852c6bae7560a1954a32ebacd94eaff4283f" -> (known after apply)
~ id                   = "3976f7791ad8afa1da3f59319df2b8a343e14a3d" -> (known after apply) 
***(3 unchanged attributes hidden)
}

*** random_pet.Pet must be replaced
-/+ resource "random_pet" "Pet" {
~ id        = "work_possibly_real_minnow" -> (known after apply)
~ separator = "_" -> "-" # forces replacement
*** (2 unchanged attributes hidden)
}

Plan: 2 to add, 0 to change, 2 to destroy.


################

*** Warning: this attribute value will be marked as sensitive and will not
      # display in UI output after applying this change. The value is unchanged.
      ~ prefix    = (sensitive value)
        # (2 unchanged attributes hidden)

# 5.2.6
 №1 Минимальный приоритет
 bash:
    export TF_VAR_prefix="env-srcret"
    export TF_VAR_rendom_pet=2
    tofu plan
 
№2 Средний приоритет
 bash:
    cp terraform.tfvars.example terraform.tfvars
    tofu plan

№3 Максимальный приоритет
    tofu plan -var="prefix=cli-secret" -var="rendom+pet=5" -var="File+petsname=cli_file.txt"
   