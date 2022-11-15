class CreateResults < ActiveRecord::Migration[7.0]
  def change
    create_join_table :college_subjects, :users, table_name: :results do |t|
      t.datetime :assign_result_date
      t.decimal :note
      t.references :type_of_result, foreign_key: true
      
      t.index :college_subject_id
      t.index :user_id

      t.timestamps
    end
  end
end
