class CreateEmpathies < ActiveRecord::Migration[6.0]
  def change
    create_table :empathies do |t|
      t.integer :good_point
      t.integer :violation
      t.integer :user_id
      t.integer :reviews_id

      t.timestamps
    end
  end
end
