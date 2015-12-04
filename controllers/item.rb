class ItemController < ApplicationController

  get "/" do
    @items = Item.all
    if authorization_check
      erb :read_items
    else
      erb :not_authorized
    end
  end

  get "/create" do
    erb :create_items
  end

  post "/create" do
    @item = Item.new
    @item.name = params[:name]
    @item.qty = params[:qty]
    @item.save
    # if @item.save
    #   redirect "/"
    # end
    @message = "Your item has been added!"
    erb :message
  end

  get "/update/:id" do
    @item = Item.find(params[:id])
    erb :update_items
  end

  post "/update" do
    @item = Item.find(params[:id])
    @item.name = params[:name]
    @item.qty = params[:qty]
    @item.save
    @message = "Item Updated Successfully!"
    erb :message
  end

  get "/destroy/:id" do
    @item = Item.find(params[:id])
    erb :destroy_items
  end

  post "/destroy" do
    @item = Item.find(params[:id])
    @item.destroy
    @message = "Item Deleted"
    erb :message
  end

end
