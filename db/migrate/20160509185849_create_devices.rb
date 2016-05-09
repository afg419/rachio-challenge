class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :rachio_device_id
      t.string :status
      t.boolean :on
      t.string :name
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
