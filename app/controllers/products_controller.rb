class ProductsController < ApplicationController
  before_action :find_by_id, only: [:show, :edit, :update, :destroy]

  def index
    if user_signed_in?
      unless session[:cart_id]
        if Cart.find_by(user_id: current_user.id) != nil
          this_cart = Cart.find_by(user_id: current_user.id)
          session[:cart_id] = this_cart.id
        else
          this_cart = Cart.create(user_id: current_user.id)
          session[:cart_id] = this_cart.id
        end
      end
    end
    @products = Item.all
  end

  def show
  end

  def new
    @product = Item.new
    render :form
  end

  def create
    @product = Item.new(product_params)
    if @product.save
      flash[:notice] = "product created."
      redirect_to products_path
    else
      render :form
    end
  end

  def edit
    render :form
  end

  def update
    if @product.update(product_params)
      flash[:notice] = "product updated."
      redirect_to products_path
    else
      render :form
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  private
    def product_params
      params.require(:product).permit(:name, :description, :price)
    end

    def find_by_id
      @product = Item.find(params[:id])
    end
end
