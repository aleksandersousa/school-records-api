class RemoveFieldsFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :registration_number, :string
    remove_column :users, :cpf, :string
    remove_column :users, :course_id
  end
end
