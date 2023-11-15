class AddCurrentlyInStateToDrivers < ActiveRecord::Migration[7.1]
  def change
    add_column :drivers, :current_state_name, :string, limit: 2
    add_index :drivers, :current_state_name, name: "index_drivers_on_current_state_name", unique: true
  end
end
