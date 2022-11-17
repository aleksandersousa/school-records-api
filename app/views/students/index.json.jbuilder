json.array! @students do |student|
  json.id student.id
  json.name student.name
  json.cpf student.cpf
  json.registration_number student.registration_number

  json.course student.course
end
