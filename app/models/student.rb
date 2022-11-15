class Student < ApplicationRecord
  belongs_to :course

  has_many :results, dependent: :destroy
  has_many :college_subjects, through: :results
end
