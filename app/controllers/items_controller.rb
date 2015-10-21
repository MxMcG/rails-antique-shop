class ItemsController < ApplicationController
  before_action :find_by_id, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @item = Item.new
    render '_form'
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "Item created."
      redirect_to homepage_admin_index_path
    else
      render '_form'
    end
  end

  def edit
    render '_form'
    p "*" * 100
  end

  def update
    if @item.update(item_params)
      flash[:notice] = "Item updated."
      redirect_to homepage_admin_index_path
    else
      render '_form'
    end
  end

  def destroy
    @item.destroy
    redirect_to homepage_admin_index_path
  end

  private
    def item_params
      params.require(:item).permit(:name, :description, :price)
    end

    def find_by_id
      @item = Item.find(params[:id])
    end
end
