json.array! @results do |result|
  json.id result.id
  json.note result.note
  json.assign_result_date result.assign_result_date

  json.type_of_result result.type_of_result
  json.college_subject result.college_subject
end
