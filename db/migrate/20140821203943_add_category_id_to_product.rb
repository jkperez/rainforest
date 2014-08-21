class AddCategoryIdToProduct < ActiveRecord::Migration
  def change
    add_reference :products, :category, index: true
  end
end
