class RenameGedgetsToGadgets < ActiveRecord::Migration[6.0]
  def change
    rename_table :gedgets, :gadgets #この行を追加！
  end
end
