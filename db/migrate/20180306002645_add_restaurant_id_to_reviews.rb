class AddRestaurantIdToReviews < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :restaurant_id, :integer, null: false
  end
end
