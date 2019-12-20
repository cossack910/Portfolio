class RenameIamgeColumnToReviews < ActiveRecord::Migration[6.0]
  def change
    rename_column :reviews, :iamge, :image
  end
end
