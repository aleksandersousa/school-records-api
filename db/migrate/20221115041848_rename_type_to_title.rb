class RenameTypeToTitle < ActiveRecord::Migration[7.0]
  def change
    change_table :type_of_results do |t|
      t.rename :type, :title
    end
  end
end
