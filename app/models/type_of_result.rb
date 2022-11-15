class TypeOfResult < ApplicationRecord
  APPROVED = {
    title: 'approved',
    description: 'Aprovado'
  }.freeze

  FAILED = {
    title: 'failed',
    description: 'Reprovado'
  }.freeze

  FAILED_FOR_LACK = {
    title: 'failed_for_lack',
    description: 'Reprovado por falta'
  }.freeze

  validates :title, :description, presence: true
end
