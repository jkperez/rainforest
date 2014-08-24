class Cart < ActiveRecord::Base
	include(ApplicationHelper)

	has_many :cart_items
	has_many :products, through: :cart_items

	def total
		total_price_in_cents = cart_items.inject(0) { |memo, item| memo + item.product.sale_adjusted_price_in_cents(item.quantity) }
		stringify_cost(total_price_in_cents/100.0)
	end

	def total_savings
		savings = cart_items.inject(0) { |memo, item| memo + item.product.savings(item.quantity)}
		stringify_cost(savings/100.0)
	end
end
