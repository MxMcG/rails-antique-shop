class InventoriesController < ApplicationController
  before_action :find_by_id, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!

  def index
    @inventories = Item.all
  end

  def show
  end

  def new
    @inventory = Item.new
    render :form, locals: {url: inventories_path, method: 'post'}
  end

  def create
    @inventory = Item.new(inventory_params)
    if @inventory.save
      flash[:notice] = "Inventory created."
      redirect_to inventories_path
    else
      render :form
    end
  end

  def edit
    render :form, locals: {url: inventory_path, method: 'put'}
  end

  def update
    if @inventory.update(inventory_params)
      flash[:notice] = "Inventory updated."
      redirect_to inventories_path
    else
      render :form
    end
  end

  def destroy
    @inventory.destroy
    redirect_to inventories_path
  end
  def restricted
    redirect_to admins_restricted
  end


  private
    def inventory_params
      params.require(:item).permit(:name, :description, :price)
    end

    def find_by_id
      @inventory = Item.find(params[:id])
    end
end