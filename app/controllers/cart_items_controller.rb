class CartItemsController < ApplicationController

  def index
    @cart_items = Cart.find(session[:cart_id]).cart_items
    p @cart_items
  end

  def create
    p CartItem.create(cart_id: session[:cart_id], item_id: params[:product_id], quantity: 1)
    p "* =" * 100
    redirect_to cart_path
  end

  def edit
  end

  def update
  end

  def destroy
    CartItem.find(params[:id]).destroy
    head :ok
  end

end
