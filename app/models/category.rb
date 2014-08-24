class Category < ActiveRecord::Base
	has_many :products

	def product_count
		products.count
	end

	def recent_3_products
		products.order(updated_at: :desc).limit(3)
	end
end
