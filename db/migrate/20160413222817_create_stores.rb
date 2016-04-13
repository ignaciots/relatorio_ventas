class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name
      t.string :number
      t.string :floor
      t.string :category
      t.string :telephone
      t.string :email

      t.timestamps null: false
    end
  end
end
