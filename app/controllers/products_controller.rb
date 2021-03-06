class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :validate_password, only: [:create, :update, :destroy]
  before_action :set_categories, only: [:new, :edit]

  # GET /products
  # GET /products.json
  def index
    @page = (params[:page] || 1).to_i 
    @offset = (@page - 1)  * 9
    @final_page = @offset + 9 >= Product.all.count
    
    @products = Product.order(updated_at: :desc).limit(9).offset(@offset).all
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @review = Review.new
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @password_valid && @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        set_categories
        format.html { render :new, notice: 'Error creating product.' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @password_valid && @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    if @password_valid
      @product.destroy
      respond_to do |format|
        format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to @product, notice: "Invalid password." }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    def set_categories
      @categories = Category.order(:name)
      # @categories = ['Category 1', 'Category 2']
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :price_in_cents, :picture, :category, :category_id, :sale)
    end
end
