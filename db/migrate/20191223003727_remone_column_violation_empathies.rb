class RemoneColumnViolationEmpathies < ActiveRecord::Migration[6.0]
  def change
    remove_column :empathies, :violation, :integer
  end
end
