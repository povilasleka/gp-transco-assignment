class AddEmailToDrivers < ActiveRecord::Migration[7.1]
  def change
    add_column :drivers, :email, :string
  end
end
