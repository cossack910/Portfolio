class RemoveColumnempatyViolation < ActiveRecord::Migration[6.0]
  def change
    #remove_column :reviews, :empathy, :integer
    remove_column :reviews, :violation_flag, :integer
  end
end
