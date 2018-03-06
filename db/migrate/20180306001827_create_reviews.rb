class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :rating, null: false
      t.string :body, null: false

      t.timestamps null: false
    end
  end
end
