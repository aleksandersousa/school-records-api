class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.string :code
      t.string :name

      t.timestamps
    end

    add_index :courses, :code, unique: true
  end
end
