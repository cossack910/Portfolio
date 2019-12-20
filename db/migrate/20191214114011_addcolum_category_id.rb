class AddcolumCategoryId < ActiveRecord::Migration[6.0]
  def change
    add_column :gadgets, :category_id, :string
  end
end
