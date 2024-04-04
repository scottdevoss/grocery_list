class GroceryController < ApplicationController
  def index
    @items = Item.all
  end
  
  def create
    @item = Item.create(name: params[:item])
    redirect_to "/grocery_list"
  end
  
  def destroy
    item = Item.find_by(params[:id])
    item.delete
    redirect_to "/grocery_list"
  end
end