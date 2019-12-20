class ChangeNameReviewImageRaview < ActiveRecord::Migration[6.0]
  def change
    rename_column :reviews, :review_image, :image 
  end
end
