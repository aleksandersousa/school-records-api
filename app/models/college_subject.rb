class CollegeSubject < ApplicationRecord
  belongs_to :course

  has_many :results, dependent: :destroy
  has_many :users, through: :results
end
