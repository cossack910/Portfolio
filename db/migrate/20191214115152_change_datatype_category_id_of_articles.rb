class ChangeDatatypeCategoryIdOfArticles < ActiveRecord::Migration[6.0]
  def change
    change_column :gadgets, :category_id, :integer 
  end
end
