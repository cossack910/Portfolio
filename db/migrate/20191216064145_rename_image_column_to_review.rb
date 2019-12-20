class RenameImageColumnToReview < ActiveRecord::Migration[6.0]
  def change
    rename_column :reviews, :image, :review_image
  end
end
