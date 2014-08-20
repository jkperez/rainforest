class Product < ActiveRecord::Base

	validates :description, :name, presence: true
	validates :price_in_cents, numericality: { only_integer: true, greater_than: 0 }
	validates :price_in_cents, numericality: { less_than: (2**31)-1, message: "is too large. Largest allowable value is 21.4 million dollars."}

	has_many :reviews

	def formatted_price
		price_in_dollars = price_in_cents.to_f / 100

		price_array = sprintf("%.2f", price_in_dollars).split('.')
		price_dollars = price_array[0]
		price_cents = price_array[1]

		place = price_dollars.length - 3

		while place >= 2
			price_dollars.insert(place, ',')
			place -= 3
		end

		"$" + price_dollars + "." + price_cents;
	end
end