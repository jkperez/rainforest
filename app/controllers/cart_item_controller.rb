class CartItemController < ApplicationController
	before_action :set_cart_item, only: [:update]

	def update
    respond_to do |format|
			if(@cart_item.update(cart_item_params))
				format.html { redirect_to '/cart/', notice: "#{@cart_item.product.name} was set to #{@cart_item.quantity}." }
			else
				format.html { redirect_to '/cart/', notice: "#Could not set #{@cart_item.product.name}'s quantity." }
			end
		end
	end

	private
		def set_cart_item
      @cart_item = CartItem.find(params[:id])
    end

		def cart_item_params
      params.require(:cart_item).permit(:id, :quantity)
    end
end
