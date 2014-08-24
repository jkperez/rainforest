class AddValidationToReviews < ActiveRecord::Migration
  def change
  	change_column :reviews, :product_id, :integer, null: false
  	change_column :reviews, :rating, :integer, null: false
  end
end
