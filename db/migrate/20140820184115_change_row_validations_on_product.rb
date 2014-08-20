class ChangeRowValidationsOnProduct < ActiveRecord::Migration
  def change
    change_column :products, :name, :string, null: false
    change_column :products, :description, :text, null: false
    change_column :products, :price_in_cents, :integer, null: false

    change_column :reviews, :comment, :text, null: false
  end
end
