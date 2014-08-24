class AddIndexToCartItems < ActiveRecord::Migration
  def change
  	change_column :cart_items, :cart_id, :integer, index: true
  	change_column :cart_items, :product_id, :integer, index: true
  end
end
