class CreateGedgets < ActiveRecord::Migration[6.0]
  def change
    create_table :gedgets do |t|
      t.string :gadget_name
      t.string :gadget_info
      t.string :url
      t.json :images

      t.timestamps
    end
  end
end
