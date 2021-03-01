class CreateReviews < ActiveRecord::Migration[4.2]
  def change
    create_table :reviews do |t|
      t.string :content
      t.integer :rating
      t.integer :show_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
