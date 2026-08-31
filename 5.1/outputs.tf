output "all_files_paths" {
  value       = {for env, mod in module.config_files : env => mod. }
  description = "пути создания файлов для всех сред"
}
output "all_pet_names" {
  value = {for env, mod in module.config_files : env => mod. }
  description = "Генерация имен животных для всех сред"
}
