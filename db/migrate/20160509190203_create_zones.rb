class CreateZones < ActiveRecord::Migration
  def change
    create_table :zones do |t|
      t.string :rachio_zone_id
      t.integer :zone_number
      t.string :name
      t.boolean :enabled
      t.references :device, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
