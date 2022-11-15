class Result < ApplicationRecord
  belongs_to :college_subject
  belongs_to :student
  belongs_to :type_of_result
end
