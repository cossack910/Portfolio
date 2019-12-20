class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :last_name
      t.string :first_name
      t.date :birthday
      t.string :gender
      t.string :mail
      t.string :mail_sub
      t.string :password_digest

      t.timestamps
    end
  end
end
