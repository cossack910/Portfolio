class AddColumnReleaseDate < ActiveRecord::Migration[6.0]
  def change
    add_column :gadgets, :release_date, :date
  end
end