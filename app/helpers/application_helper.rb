module ApplicationHelper
	def stringify_cost(cost)
		price_in_dollars = sprintf("%.2f", cost)

		place = price_in_dollars.rindex('.') - 3

		while place > 0
			price_in_dollars.insert(place, ',')
			place -= 3
		end

		"$" + price_in_dollars
	end
end
