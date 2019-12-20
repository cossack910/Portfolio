class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :good_review
      t.string :bad_review
      t.string :iamge
      t.integer :gadget_id
      t.integer :user_id
      t.integer :empathy

      t.timestamps
    end
  end
end
