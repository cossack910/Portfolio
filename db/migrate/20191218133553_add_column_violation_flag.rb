class AddColumnViolationFlag < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :violation_flag, :integer
  end
end
