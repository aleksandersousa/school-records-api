class CreateCollegeSubjects < ActiveRecord::Migration[7.0]
  def change
    create_table :college_subjects do |t|
      t.string :code
      t.string :name
      t.integer :workload
      t.references :course, foreign_key: true

      t.timestamps
    end

    add_index :college_subjects, :code, unique: true
  end
end
