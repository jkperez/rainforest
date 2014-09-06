class ApplicationController < ActionController::Base
	before_action :set_cart
		
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  	def set_cart
  		unless session[:cart_id]
  			new_cart = Cart.new
  			new_cart.save
  			session[:cart_id] = new_cart.id
  		end
  		@cart = Cart.find(session[:cart_id])
  	end

  	def validate_password
      @password_valid = Rails.application.secrets.secret_password == params[:password]
    end
end
