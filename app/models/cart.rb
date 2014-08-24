class Cart < ActiveRecord::Base
	has_many :cart_items
	has_many :products, through: :cart_items
end
