class RenameReviewsIdColumnToEmpathies < ActiveRecord::Migration[6.0]
  def change
    rename_column :empathies, :reviews_id, :review_id
  end
end
