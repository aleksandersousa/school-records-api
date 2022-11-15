class ChangeUserReferenceForStudentReference < ActiveRecord::Migration[7.0]
  def change
    remove_column :results, :user_id
    add_reference :results, :student, foreign_key: true, index: true
  end
end
