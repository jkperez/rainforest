class ChangeValidationOnCartItem < ActiveRecord::Migration
  def change
  	change_column :cart_items, :quantity, :integer, null: false
  	change_column :cart_items, :cart_id, :integer, null: false
  	change_column :cart_items, :product_id, :integer, null: false
  end
end
