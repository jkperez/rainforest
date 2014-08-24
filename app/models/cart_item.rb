class CartItem < ActiveRecord::Base
	validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }

  belongs_to :product
  belongs_to :cart
end
