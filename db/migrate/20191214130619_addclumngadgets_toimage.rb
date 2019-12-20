class AddclumngadgetsToimage < ActiveRecord::Migration[6.0]
  def change
    add_column :gadgets, :image, :string
    remove_column :gadgets, :images, :json
  end
end
