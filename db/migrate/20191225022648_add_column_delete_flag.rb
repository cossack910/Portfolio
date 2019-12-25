class AddColumnDeleteFlag < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :delete_flag, :integer
  end
end
