class HomepageAdminController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    render 'homepage_admin/_form'
  end

  def show
    @item = Item.find(params[:id])
    render 'items/item'
  end

  def create
    @item = Item.new(params[:id])

    @item.save
    redirect_to @item
  end

  # def edit
  #   @item = Item.find(params[:id])
  #   render 'homepage_admin/_form'
  # end

  # def update
  #   @item = Item.find(params[:id])

  #   if @item.update(article_params)
  #     redirect_to 'homepage_admin/index'
  #   else
  #     render 'homepage_admin/_form'
  #   end
  # end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to '/homepage_admin/index'
  end

  private
    def item_params
      params.require(:item).permit(:name, :description, :price)
    end

end
