class Category < ActiveRecord::Base
	has_many :products

	def product_count
		products.count
	end
end
