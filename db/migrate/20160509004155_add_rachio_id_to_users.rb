class AddRachioIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :rachio_id, :string
  end
end
