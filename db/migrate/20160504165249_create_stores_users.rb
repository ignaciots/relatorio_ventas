class CreateStoresUsers < ActiveRecord::Migration
  def change
    create_table :stores_users do |t|
      t.references :store, :user

      t.timestamps null: false
    end
    add_index :stores_users, [:store_id, :user_id]
  end
end
