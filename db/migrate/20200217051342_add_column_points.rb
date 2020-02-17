class AddColumnPoints < ActiveRecord::Migration[6.0]
  def change
    add_column :gadgets, :performance_point, :double

    add_column :gadgets, :design_point, :double

    add_column :gadgets, :costperformance_point, :double

    add_column :gadgets, :feel_point, :double

  end
end
