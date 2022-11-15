class AddIdToResults < ActiveRecord::Migration[7.0]
  def change
    add_column :results, :id, :serial, primary_key: true
  end
end
