class GroceryController < ApplicationController
  def index
    @items = Item.all
  end
  
  def create
    @items = Item.create!(name: params[:item])
    redirect_to "/grocery_list"
  end

  def edit
    @items = Item.find(params[:id])
  end
  
  def update
    @items = Item.find(params[:id])
    @items.update!(item_params)
    redirect_to "/grocery_list"
  end
  
  def destroy
    item = Item.find(params[:id])
    item.delete
    redirect_to "/grocery_list"
  end

  private

  def item_params
    params.permit(:name)
  end
end