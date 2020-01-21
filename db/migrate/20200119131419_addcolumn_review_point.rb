class AddcolumnReviewPoint < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :review_point, :double
    add_column :gadgets, :review_point, :double
  end
end
