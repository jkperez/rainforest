class CartItemController < ApplicationController
	before_action :set_cart_item, only: [:update, :destroy]

	def create 
		cart = Cart.take
		product_id = params[:p]

		cart_item = CartItem.find_by(cart_id: cart.id, product_id: product_id)
		if(cart_item)
			cart_item.quantity += 1;
			success_message = "#{cart_item.product.name}'s quantity been updated to #{cart_item.quantity}."
		else
			cart_item = CartItem.new
			cart_item.cart = cart
			cart_item.product = Product.find product_id
			cart_item.quantity = 1;
			success_message = "#{cart_item.product.name} has been added to the cart."
		end

		respond_to do |format|
			if(cart_item.save)
				format.html { redirect_to '/cart/', notice: success_message}
			else
				format.html { redirect_to root_path, notice: "Could not add product to your cart."}
			end
		end
	end

	def update
    respond_to do |format|
			if(@cart_item.update(cart_item_params))
				format.html { redirect_to '/cart/', notice: "#{@cart_item.product.name} was set to #{@cart_item.quantity}." }
			else
				format.html { redirect_to '/cart/', notice: "#Could not set #{@cart_item.product.name}'s quantity." }
			end
		end
	end

	def destroy
		product_name = @cart_item.product.name
    @cart_item.destroy
    respond_to do |format|
      format.html { redirect_to '/cart/', notice: "\"#{product_name}\" was removed from the cart." }
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
