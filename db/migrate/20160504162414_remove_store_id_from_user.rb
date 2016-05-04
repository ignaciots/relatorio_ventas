class RemoveStoreIdFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :store_id, :integer
  end
end
