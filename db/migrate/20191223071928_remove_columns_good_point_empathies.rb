class RemoveColumnsGoodPointEmpathies < ActiveRecord::Migration[6.0]
  def change
    remove_column :empathies, :good_point, :integer
  end
end
