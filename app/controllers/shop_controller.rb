class ShopController < ApplicationController
  def index

    @products = Product.all
    @categories = Category.all

    #render :text => params[:id]
  end

end
