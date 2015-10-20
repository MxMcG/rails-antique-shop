class ItemsController < ApplicationController
  def index
    @items = Item.all
    render 'homepage_admin/index'
  end

  def show
    @item = Item.find(params[:id])
    render 'items/item'
  end

  def new
    @item = Item.new
    render 'items/_new'
  end

  def create
    p params["item"]
    p "*" * 100
    @item = Item.new(item_params)
    @item.save
    redirect_to '/homepage_admin/index'
  end

  def edit
    @item = Item.find(params[:id])
    render 'items/_edit'
  end

  def update
    @item = Item.find(params[:id])

    if @item.update(item_params)
      redirect_to '/homepage_admin/index'
    else
      render '/homepage_admin/_form'
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path
  end

  private
    def item_params
      params.require(:item).permit(:name, :description, :price)
    end

end
