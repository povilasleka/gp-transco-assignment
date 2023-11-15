class UpdateDriverColumnLimits < ActiveRecord::Migration[7.1]
  def change
    change_column :drivers, :first_name, :string, limit: 50, null: false
    change_column :drivers, :last_name, :string, limit: 50, null: false
    change_column :drivers, :license_plate, :string, limit: 10, null: false
    change_column :drivers, :email, :string, limit: 62, null: false
  end
end
