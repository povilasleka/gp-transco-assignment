class CreateGpsEntries < ActiveRecord::Migration[7.1]
  def change
    create_table :gps_entries do |t|
      t.decimal :lat, precision: 10, scale: 6
      t.decimal :lng, precision: 10, scale: 6
      t.references :state, foreign_key: true

      t.belongs_to :driver, foreign_key: true

      t.timestamps
    end
  end
end
