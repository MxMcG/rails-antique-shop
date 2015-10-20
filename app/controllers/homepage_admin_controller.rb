class HomepageAdminController < ApplicationController
  def index
    @items = Item.all
  end
end
