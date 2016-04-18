class RemoveCategoryFromStore < ActiveRecord::Migration
  def change
    remove_column :stores, :category, :string
  end
end
