class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :validate_password, only: [:create, :update, :destroy]
  
  def index
    @categories = Category.all
  end

  def show
    @page = (params[:page] || 1).to_i 
    per_page = 9
    @offset = (@page - 1)  * per_page
    @final_page = @offset + per_page >= @category.products.count
    
    @products = @category.products.order(updated_at: :desc).limit(9).offset(@offset).all
  end

  def new
    @category = Category.new
  end

  def create    
    @category = Category.new(category_params)
    
    respond_to do |format|
      if @password_valid && @category.save
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new, notice: 'Category could not be created.' }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    respond_to do |format|
      if @password_valid && @category.update(category_params)
        format.html { redirect_to @category, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @password_valid
      category_name = @category.name
      @category.destroy
      respond_to do |format|
        format.html { redirect_to categories_path, notice: "\"#{category_name}\" was removed." }
      end
    else
      respond_to do |format|
        format.html { redirect_to categories_path, notice: "Error deleting category." }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:id, :name)
    end
end
