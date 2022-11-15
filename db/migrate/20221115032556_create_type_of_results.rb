class CreateTypeOfResults < ActiveRecord::Migration[7.0]
  def change
    create_table :type_of_results do |t|
      t.string :type
      t.string :description

      t.timestamps
    end
  end
end
