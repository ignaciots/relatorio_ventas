class AddPropertyIdToStore < ActiveRecord::Migration
  def change
    add_column :stores, :property_id, :integer
    add_index :stores, :property_id
  end
end
