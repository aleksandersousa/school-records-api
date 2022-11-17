json.array! @results do |result|
  json.id result.id
  json.note result.note
  json.assign_result_date result.assign_result_date

  json.type_of_result result.type_of_result
  json.college_subject result.college_subject
  json.student do
    json.id result.student.id
    json.name result.student.name
    json.registration_number result.student.registration_number
    json.course result.student.course
  end
end
